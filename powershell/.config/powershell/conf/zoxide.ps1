if ( -not ( Get-Command zoxide -ErrorAction SilentlyContinue ) ) {
    return
}

### Beginning zoxide confuguration ###

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on zoxide's format.
function __zoxide_pwd {
    $cwd = Get-Location
    if ($cwd.Provider.Name -eq "FileSystem") {
        $cwd.ProviderPath
    }
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd($dir, $literal) {
    $dir = if ($literal) {
        Set-Location -LiteralPath $dir -Passthru -ErrorAction Stop
    }
    else {
        Set-Location -Path $dir -Passthru -ErrorAction Stop
    }
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook {
    $result = __zoxide_pwd
    if ($null -ne $result) {
        zoxide add -- $result
    }
}

# Initialize hook.

$__zoxide_hooked = (Get-Variable __zoxide_hooked -ValueOnly -ErrorAction SilentlyContinue)
if ($__zoxide_hooked -ne 1) {
    $__zoxide_hooked = 1
    if ($PSVersionTable.PSVersion.Major -ge 6) {
        $ExecutionContext.InvokeCommand.LocationChangedAction = {
            $null = __zoxide_hook
        }
    }
    else {
        Write-Error ("`n" +
            "zoxide: PWD hooks are not supported below powershell 6.`n" +
            "        Use 'zoxide init powershell --hook prompt' instead.")
    }
}

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function __zoxide_z {
    if ($args.Length -eq 0) {
        __zoxide_cd ~ $true
    }
    elseif (
        $args.Length -eq 1 -and
        (($args[0] -eq '-' -or $args[0] -eq '+') -or (Test-Path $args[0] -PathType Container))
    ) {
        __zoxide_cd $args[0] $false
    }
    else {
        $result = __zoxide_pwd
        if ($null -ne $result) {
            $result = zoxide query --exclude $result -- @args
        }
        else {
            $result = zoxide query -- @args
        }
        if ($LASTEXITCODE -eq 0) {
            __zoxide_cd $result $true
        }
    }
}

# Jump to a directory using interactive search.
function __zoxide_zi {
    $result = zoxide query -i -- @args
    if ($LASTEXITCODE -eq 0) {
        __zoxide_cd $result $true
    }
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

Set-Alias -Name z -Value __zoxide_z -Option AllScope -Scope Global -Force
Set-Alias -Name zi -Value __zoxide_zi -Option AllScope -Scope Global -Force

# =============================================================================
#
# To initialize zoxide, add this to your configuration (find it by running
# `echo $profile` in PowerShell):
#
Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook | Out-String) })

### End zoxide configuration ###