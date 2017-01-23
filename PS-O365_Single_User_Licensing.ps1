Connect-MsolService
Write-Host -ForegroundColor Cyan O365 Powershell Session Connected
$upn = Read-host -Prompt 'Input UserPrincipalName'
$UsageLocation = Read-host -Prompt 'Input two character country code'
Set-MsolUser -UserPrincipalName $upn -UsageLocation $UsageLocation
$DisabledPlans = New-MsolLicenseOptions -AccountSkuId Claranet:ENTERPRISEPACK -DisabledPlans EXCHANGE_S_ENTERPRISE,TEAMS1,RMS_S_ENTERPRISE,YAMMER_ENTERPRISE,SWAY,PROJECTWORKMANAGEMENT,POWERAPPS_O365_P2,FLOW_O365_P2
Get-MsolUser -UserPrincipalName $upn | Set-MsolUserLicense -LicenseOptions $DisabledPlans
Write-Host -ForegroundColor Cyan O365 License Assigned
Write-Host -ForegroundColor Green If you got any errors the license is not assigned