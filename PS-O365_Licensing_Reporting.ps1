Write-Host -ForegroundColor Cyan 'Claranet O365 Licensing Reporting Script - IT Support UK'
Connect-MsolService
Write-Host -ForegroundColor Green O365 Powershell Session Connected
pause
[int]$xMenuChoiceA = 0
while ( $xMenuChoiceA -lt 1 -or $xMenuChoiceA -gt 9 ){
Write-host -ForegroundColor Cyan "1. See users with VISIO license assigned"
Write-host -ForegroundColor Cyan "2. See users with PROJECT license assigned"
Write-host -ForegroundColor Cyan "3. See users with Skype for Business PSTN dial-in"
Write-host -ForegroundColor Cyan "4. See users with AzureAD Basic license assigned"
Write-host -ForegroundColor Cyan "5. See users with Project Essentials license assigned"
Write-host -ForegroundColor Cyan "6. See users with InTune license assigned"
Write-host -ForegroundColor Cyan "7. See users with Enterprise Mobility Suite license assigned"
Write-host -ForegroundColor Cyan "8. See users with Project Online license assigned"
Write-host -ForegroundColor Red "9. Quit and exit"
[Int]$xMenuChoiceA = read-host "Please enter an option 1 to 9..." }
Switch( $xMenuChoiceA ){
  1{
$path = Read-Host -Prompt 'Input the path for file export or press enter to see on screen'
Get-MsolUser -All | where {$_.isLicensed -eq $true -and $_.Licenses.AccountSKUID -eq "Claranet:VISIOCLIENT"} | select displayname,userprincipalname #>> $path
}
  2{
$path = Read-Host -Prompt 'Input the path for file export or press enter to see on screen'
Get-MsolUser -All | where {$_.isLicensed -eq $true -and $_.Licenses.AccountSKUID -eq "Claranet:PROJECTCLIENT"} | select displayname,userprincipalname #>> $path
  }
  3{
$path = Read-Host -Prompt 'Input the path for file export or press enter to see on screen'
Get-MsolUser -All | where {$_.isLicensed -eq $true -and $_.Licenses.AccountSKUID -eq "Claranet:MCOMEETADV"} | select displayname,userprincipalname #>> $path
  }
  4{
$path = Read-Host -Prompt 'Input the path for file export or press enter to see on screen'
Get-MsolUser -All | where {$_.isLicensed -eq $true -and $_.Licenses.AccountSKUID -eq "Claranet:AAD_BASIC"} | select displayname,userprincipalname #>> $path
  }
  5{
$path = Read-Host -Prompt 'Input the path for file export or press enter to see on screen'
Get-MsolUser -All | where {$_.isLicensed -eq $true -and $_.Licenses.AccountSKUID -eq "Claranet:PROJECTESSENTIALS"} | select displayname,userprincipalname #>> $path
  }
  6{
$path = Read-Host -Prompt 'Input the path for file export or press enter to see on screen'
Get-MsolUser -All | where {$_.isLicensed -eq $true -and $_.Licenses.AccountSKUID -eq "Claranet:INTUNE_A"} | select displayname,userprincipalname #>> $path
  }
  7{
$path = Read-Host -Prompt 'Input the path for file export or press enter to see on screen'
Get-MsolUser -All | where {$_.isLicensed -eq $true -and $_.Licenses.AccountSKUID -eq "Claranet:EMS"} | select displayname,userprincipalname #>> $path
  }
  8{
$path = Read-Host -Prompt 'Input the path for file export or press enter to see on screen'
Get-MsolUser -All | where {$_.isLicensed -eq $true -and $_.Licenses.AccountSKUID -eq "Claranet:PROJECTONLINE_PLAN_1"} | select displayname,userprincipalname #>> $path
  }
default{
exit
}
}