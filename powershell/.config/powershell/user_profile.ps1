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
# --color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
# --color info:136,prompt:136,pointer:230,marker:230,spinner:136',
        'user')
}

$Extension = ".py", ".js", ".java", ".go", ".json", ".yml", ".toml"
foreach ( $value in $Extension ) {
    $PSStyle.FileInfo.Extension["$value"] = "`e[33;1m"
}

$psStyle.FileInfo.Directory = "`e[35;1m"

# Powershell configuration directory
$CUSTOMPSHOME = "$ENV:USERPROFILE\\.config\\powershell"

# Setting the terminal title
function Invoke-Starship-PreCommand {
    $host.ui.Write("`e]0; PS> $env:USERNAME@$env:COMPUTERNAME`: $pwd `a")
}

# Prompt
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

# Functions
foreach ($PFunction in Get-ChildItem "$CUSTOMPSHOME\\functions") {
    if ($PFunction.name -match "\\*.ps1") {
        . $PFunction
    }
}

# Modules
$PSGalleryModules = "PSReadLine", "posh-git", "npm-completion"

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
function SHL { Get-ChildItem -Name }
function APGR { shutdown -s -t 0 }
function RSRT { shutdown -r -t 0 }
function SALR { shutdown -l }

Set-Alias -Name Apagar -Value APGR
Set-Alias -Name Reiniciar -Value RSRT
Set-Alias -Name Salir -Value SALR
Set-Alias -Name la -Value SHL
Set-Alias -Name which -Value Get-Command
Set-Alias -Name grep -Value findstr
Set-Alias -Name less -Value "$env:USERPROFILE\AppData\Local\Programs\Git\usr\bin\less.exe"
Set-Alias -Name lg -Value "$env:USERPROFILE\go\bin\lazygit.exe"
Set-Alias -Name n -Value nvim
