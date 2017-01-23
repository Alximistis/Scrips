Write-Host -ForegroundColor Cyan 'Claranet O365 Licensing Script - IT Support UK'
Connect-MsolService
Write-Host -ForegroundColor Green O365 Powershell Session Connected
pause
[int]$xMenuChoiceA = 0
while ( $xMenuChoiceA -lt 1 -or $xMenuChoiceA -gt 4 ){
Write-host -ForegroundColor Magenta "1. See licenses assigned to a single user in O365"
Write-host -ForegroundColor Cyan "2. Assign O365 E3 License to a single user with Claranet specific plans enabled"
Write-host -ForegroundColor Cyan "3. Assign Skype for Business PSTN dial-in to a single user"
Write-host -ForegroundColor Red "4. Quit and exit"
[Int]$xMenuChoiceA = read-host "Please enter an option 1 to 4..." }
Switch( $xMenuChoiceA ){
  1{
$upn = Read-host -Prompt 'Input User Principal Name'
$path = Read-Host -Prompt 'Input the path for file export or press enter to see on screen'
Get-MsolUser -UserPrincipalName $upn | fl DisplayName,Licenses,UsageLocation #>> $path
}
  2{
$upn = Read-host -Prompt 'Input UserPrincipalName'
$UsageLocation = Read-host -Prompt 'Input two character country code'
Set-MsolUser -UserPrincipalName $upn -UsageLocation $UsageLocation
$DisabledPlans = New-MsolLicenseOptions -AccountSkuId Claranet:ENTERPRISEPACK -DisabledPlans EXCHANGE_S_ENTERPRISE,TEAMS1,RMS_S_ENTERPRISE,YAMMER_ENTERPRISE,SWAY,PROJECTWORKMANAGEMENT,POWERAPPS_O365_P2,FLOW_O365_P2
Get-MsolUser -UserPrincipalName $upn | Set-MsolUserLicense -LicenseOptions $DisabledPlans
Write-Host -ForegroundColor Green O365 License Assigned
Write-Host -ForegroundColor Magenta If you got any errors the license is not assigned
  }
  3{
$upn = Read-host -Prompt 'Input UserPrincipalName'
$DisabledPlans = New-MsolLicenseOptions -AccountSkuId "Claranet:MCOMEETADV"
Get-MsolUser -UserPrincipalName $upn | Set-MsolUserLicense -LicenseOptions $DisabledPlans
Write-Host -ForegroundColor Cyan O365 SFB PSTN dial in License Assigned
Write-Host -ForegroundColor Green If you got any errors the license is not assigned
  }
default{
exit
}
}