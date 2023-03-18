if ( -not ( Get-Command gh -ErrorAction SilentlyContinue ) ) {
    return
}

Invoke-Expression -Command $(gh completion -s powershell | Out-String)
