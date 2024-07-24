using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# Powershell configuration directory
$CUSTOMPSHOME = "$ENV:USERPROFILE\\.config\\powershell"
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

# Prompt
# if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
#   oh-my-posh init pwsh --config "$CUSTOMPSHOME\catppuccin_mod.omp.json" | Invoke-Expression
# }
if (Get-Command starship -ErrorAction SilentlyContinue) {
  function Invoke-Starship-PreCommand {
    $host.ui.RawUI.WindowTitle = "$env:USERNAME@$env:COMPUTERNAME`: $pwd `a"

    $loc = $executionContext.SessionState.Path.CurrentLocation;
    $prompt = "$([char]27)]9;12$([char]7)"

    if ($loc.Provider.Name -eq "FileSystem")
    {
      $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }

    $host.ui.Write($prompt)
  }

  Invoke-Expression (&starship init powershell)
}

# Environment variables
if ( -not ( $env:BAT_THEME ) ) {
  [Environment]::SetEnvironmentVariable('BAT_THEME', 'base16', 'user')
}

if ( -not ( $Env:FZF_DEFAULT_OPTS ) ) {
  [Environment]::SetEnvironmentVariable(
      'FZF_DEFAULT_OPTS',
      '--height 50% --layout=reverse',
      'user')
}

# Functions
foreach ($PFunction in Get-ChildItem "$CUSTOMPSHOME\\functions") {
  if ($PFunction.name -match "\\*.ps1") {
    . $PFunction
  }
}

# conf
foreach ($PConfig in Get-ChildItem "$CUSTOMPSHOME\\conf") {
  if ($PConfig.name -match "\\*.ps1") {
    . $PConfig
  }
}

# Alias
function __SHL { param( $path ) Get-ChildItem -Path $path | Format-Wide -AutoSize }
function __CUSTOM_BAT { param( $path ) if (Get-Command bat -ErrorAction SilentlyContinue) { bat -p $path } else { cat $path } }
function __TOUCH { param($path) New-Item -ItemType File -Path $path }
function __EXALS { param( $path ) eza -F --icons --group-directories-first $path }
function __EXALA { param( $path ) eza -lahF --icons --group-directories-first $path }

if (Get-Command eza -ErrorAction SilentlyContinue) {
  Set-Alias -Name ls -Value __EXALS
  Set-Alias -Name la -Value __EXALA
} else {
  Set-Alias -Name ls -Value __SHL
  Set-Alias -Name la -Value Get-ChildItem
}
Set-Alias -Name which -Value Get-Command
Set-Alias -Name open -Value Invoke-Item
Set-Alias -Name n -Value nvim
Set-Alias -Name pd -Value podman
Set-Alias -Name lg -Value lazygit
Set-Alias -Name cat -Value __CUSTOM_BAT
Set-Alias -Name touch -Value __TOUCH
