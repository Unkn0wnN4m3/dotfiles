using namespace System.Management.Automation
using namespace System.Management.Automation.Language

if (Get-Command aliae -ErrorAction SilentlyContinue) {
  aliae init pwsh | Invoke-Expression
}

# if (Get-Command starship -ErrorAction SilentlyContinue) {
#   function Invoke-Starship-PreCommand {
#     $host.ui.RawUI.WindowTitle = "$env:USERNAME@$env:COMPUTERNAME`: $pwd `a"
#
#     $loc = $executionContext.SessionState.Path.CurrentLocation;
#     $prompt = "$([char]27)]9;12$([char]7)"
#
#     if ($loc.Provider.Name -eq "FileSystem")
#     {
#       $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
#     }
#
#     $host.ui.Write($prompt)
#   }
#
#   Invoke-Expression (&starship init powershell)
# }
