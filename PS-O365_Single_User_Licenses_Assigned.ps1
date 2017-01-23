#This is a PowerShell script that queries the Assigned Licenses and the Usage Location for the User specified
Connect-MsolService
Write-Host -ForegroundColor Cyan O365 Powershell Session Connected
$upn = Read-host -Prompt 'Input User Principal Name'
$path = Read-Host -Prompt 'Input the path for file export'
Get-MsolUser -UserPrincipalName $upn | fl DisplayName,Licenses,UsageLocation #>> $path