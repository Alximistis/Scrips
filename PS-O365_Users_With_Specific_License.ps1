Write-Host -ForegroundColor Cyan O365 Powershell Session Connected
$License = Read-host -Prompt 'Input AccountSKUID'
Get-MsolUser -All | where {$_.isLicensed -eq $true -and $_.Licenses.AccountSKUID -eq "License"} | select displayname,userprincipalname