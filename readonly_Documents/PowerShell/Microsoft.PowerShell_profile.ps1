# support Unicode characters properly to avoid The UnicodeEncodeError in python
$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUTF8 = "1"

# Environment variables


# Initialize starship if available
if (Get-Command starship) {
    $env:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
    Invoke-Expression (&starship init powershell)
}

# Initialize zoxide if available
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

# Import-Module PSCompletions


