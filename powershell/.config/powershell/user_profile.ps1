using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# Environment variables
$Env:BAT_THEME = 'base16'
$Env:FZF_DEFAULT_OPTS = '--height 50% --layout=reverse
--color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
--color info:136,prompt:136,pointer:230,marker:230,spinner:136'

# Powershell configuration directory
$__CUSTOMPSHOME = "$ENV:USERPROFILE\\.config\\powershell"

# Setting the terminal title
function Invoke-Starship-PreCommand {
    $host.ui.Write("`e]0; PS> $env:USERNAME@$env:COMPUTERNAME`: $pwd `a")
}

# Prompt
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

# Functions
foreach ($PFunction in Get-ChildItem "$__CUSTOMPSHOME\\functions") {
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
foreach ($PConfig in Get-ChildItem "$__CUSTOMPSHOME\\conf") {
    if ($PConfig.name -match "\\*.ps1") {
        . $PConfig
    }
}

# Alias
Set-Alias -Name la -Value Get-ChildItem
Set-Alias -Name which -Value Get-Command
Set-Alias -Name grep -Value findstr
Set-Alias -Name less -Value "$env:USERPROFILE\AppData\Local\Programs\Git\usr\bin\less.exe"
Set-Alias -Name lg -Value "$env:USERPROFILE\go\bin\lazygit.exe"
Set-Alias -Name py -Value python
Set-Alias -Name n -Value nvim
