Set-ExecutionPolicy RemoteSigned

$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $session

$SearchName = Read-Host -Prompt "Name of Search"

New-ComplianceSearchAction -SearchName "$SearchName" -Purge -PurgeType SoftDelete

