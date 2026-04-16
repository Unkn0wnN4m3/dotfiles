if (Get-Command aliae -ErrorAction SilentlyContinue) {
  aliae init pwsh | Invoke-Expression
}
