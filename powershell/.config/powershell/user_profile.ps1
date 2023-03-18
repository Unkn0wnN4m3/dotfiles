using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# Environment variables
if ( -not ( $env:BAT_THEME ) ) {
    [Environment]::SetEnvironmentVariable('BAT_THEME', 'base16', 'user')
}

if ( -not ( $Env:FZF_DEFAULT_OPTS ) ) {
    [Environment]::SetEnvironmentVariable(
            'FZF_DEFAULT_OPTS',
            '--height 50% --layout=reverse
            --color=fg:#e0def4,bg:#2a273f,hl:#6e6a86
            --color=fg+:#908caa,bg+:#232136,hl+:#908caa
            --color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7
            --color=marker:#ea9a97,spinner:#eb6f92,header:#ea9a97',
            'user')
}

[String[]]$c_extension = ".json", ".jsonc", ".yaml", ".toml", ".xml"
[String[]]$p_extension = ".py", ".js", ".jsx", ".java", ".go", ".ts", ".tsx", ".bat", ".ps1"

foreach ( $cvalue in $c_extension ) {
    $PSStyle.FileInfo.Extension["$cvalue"] = "`e[33;1m"
}

foreach ( $pvalue in $p_extension ) {
    $PSStyle.FileInfo.Extension["$pvalue"] = "`e[34;1m"
}

$psStyle.FileInfo.Directory = "`e[35;1m"

# Powershell configuration directory
$CUSTOMPSHOME = "$ENV:USERPROFILE\\.config\\powershell"

# Prompt
if (Get-Command starship -ErrorAction SilentlyContinue) {
    function Invoke-Starship-PreCommand {
        $loc = $executionContext.SessionState.Path.CurrentLocation;
        $prompt = "$([char]27)]9;12$([char]7)"
            if ($loc.Provider.Name -eq "FileSystem")
            {
                $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
            }
        $host.ui.Write($prompt)
    }

    # Setting the terminal title
    Invoke-Expression (&starship init powershell)
}

# Functions
foreach ($PFunction in Get-ChildItem "$CUSTOMPSHOME\\functions") {
    if ($PFunction.name -match "\\*.ps1") {
        . $PFunction
    }
}

# Modules
[String[]]$PSGalleryModules = "PSReadLine", "posh-git", "npm-completion"

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
function __SHL { param( $path ) Get-ChildItem -Path $path -Name }
function __NVIMN { param ( $path ) nvim --noplugin -u NONE $path }
function __APGR { shutdown -s -t 0 }
function __RSRT { shutdown -r -t 0 }
function __SALR { shutdown -l }

Set-Alias -Name Apagar -Value __APGR
Set-Alias -Name Reiniciar -Value __RSRT
Set-Alias -Name Salir -Value __SALR
Set-Alias -Name la -Value __SHL
Set-Alias -Name which -Value Get-Command
Set-Alias -Name grep -Value findstr
Set-Alias -Name less -Value "C:\Program Files\Git\usr\bin\less.exe"
# Set-Alias -Name lg -Value "$env:USERPROFILE\go\bin\lazygit.exe"
Set-Alias -Name n -Value nvim
Set-Alias -Name nvimn -Value __NVIMN
