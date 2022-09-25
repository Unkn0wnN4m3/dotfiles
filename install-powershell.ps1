# change user profile configuration
$new_userprofile = '. $ENV:USERPROFILE\.config\powershell\user_profile.ps1'

if ( -not ( $(Get-Content $PROFILE.CurrentUserCurrentHost) -match $new_userprofile ) ) {
    Write-Output $new_userprofile >> $PROFILE.CurrentUserCurrentHost
}

# Set everything inside config directory
$config_path = "$env:USERPROFILE\.config"

if ( -not ( Test-Path $config_path ) ) {
    New-Item $env:USERPROFILE\.config -ItemType Directory
}

if ( -not ( Test-Path "$config_path\powershell" ) ) {
    Copy-Item -Recurse .\powershell\.confing\powershell -Destination $config_path
}

if ( -not ( Test-Path "$config_path\starship.toml" ) ) {
    Copy-Item .\starship\.config\starship.toml -Destination $config_path
}
