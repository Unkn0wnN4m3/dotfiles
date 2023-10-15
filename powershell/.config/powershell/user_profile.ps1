using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# Prompt
oh-my-posh init pwsh --config "~/.config/custom.omp.json" | Invoke-Expression

# if (Get-Command starship -ErrorAction SilentlyContinue) {
#     function Invoke-Starship-PreCommand {
#         $host.ui.RawUI.WindowTitle = "$env:USERNAME@$env:COMPUTERNAME`: $pwd `a"
#     }

#     function Invoke-Starship-TransientFunction {
#         &starship module character
#     }

#     # Setting the terminal title
#     Invoke-Expression (&starship init powershell)

#     Enable-TransientPrompt
# }

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

# Powershell configuration directory
$CUSTOMPSHOME = "$ENV:USERPROFILE\\.config\\powershell"

# Functions
foreach ($PFunction in Get-ChildItem "$CUSTOMPSHOME\\functions") {
    if ($PFunction.name -match "\\*.ps1") {
        . $PFunction
    }
}

# Modules
[String[]]$PSGalleryModules = "PSReadLine", "posh-git", "Terminal-Icons"

foreach ($PModule in $PSGalleryModules) {
    Import-Module $PModule -ErrorAction SilentlyContinue
}

# conf
foreach ($PConfig in Get-ChildItem "$CUSTOMPSHOME\\conf") {
    if ($PConfig.name -match "\\*.ps1") {
        . $PConfig
    }
}

# Alias
function __SHL { param( $path ) Get-ChildItem -Path $path | Format-Wide -AutoSize }

Set-Alias -Name ls -Value __SHL
Set-Alias -Name la -Value Get-ChildItem
Set-Alias -Name which -Value Get-Command
Set-Alias -Name open -Value Invoke-Item
Set-Alias -Name grep -Value findstr
Set-Alias -Name less -Value "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias -Name n -Value nvim
Set-Alias -Name jq -Value jq-Win64
Set-Alias -Name pd -Value podman
