if ( -not ( Get-Command uv -ErrorAction SilentlyContinue ) ) {
    return
}

(& uv generate-shell-completion powershell) | Out-String | Invoke-Expression
(& uvx --generate-shell-completion powershell) | Out-String | Invoke-Expression
