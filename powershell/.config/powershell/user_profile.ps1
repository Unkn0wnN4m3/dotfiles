using namespace System.Management.Automation
using namespace System.Management.Automation.Language

if (Get-Command aliae -ErrorAction SilentlyContinue) {
  aliae init pwsh | Invoke-Expression
}
