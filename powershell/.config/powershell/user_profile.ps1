using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# Prompt
oh-my-posh init pwsh --config "~/.config/custom-catppuccin.omp.json" | Invoke-Expression

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
            '--height 50% --layout=reverse
            --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
            --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
            --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8',
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
Set-Alias -Name lg -Value lazygit
Set-Alias -Name n -Value nvim
Set-Alias -Name jq -Value jq-win64
