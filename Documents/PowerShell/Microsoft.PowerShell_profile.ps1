Invoke-Expression (&starship init powershell)
fnm env --use-on-cd | Out-String | Invoke-Expression
