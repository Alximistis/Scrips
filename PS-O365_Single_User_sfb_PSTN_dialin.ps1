Connect-MsolService
Write-Host -ForegroundColor Cyan O365 Powershell Session Connected
$upn = Read-host -Prompt 'Input UserPrincipalName'
$DisabledPlans = New-MsolLicenseOptions -AccountSkuId "Claranet:MCOMEETADV"
Get-MsolUser -UserPrincipalName $upn | Set-MsolUserLicense -addlicenses "Claranet:MCOMEETADV" -LicenseOptions $null
Write-Host -ForegroundColor Cyan O365 SFB PSTN dial in License Assigned
Write-Host -ForegroundColor Green If you got any errors the license is not assigned