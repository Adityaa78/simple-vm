
# Install ADDS prerequisites 
Add-WindowsFeature RSAT-AD-Tools 
Add-WindowsFeature -Name "ad-domain-services" -IncludeAllSubFeature -IncludeManagementTools 
Add-WindowsFeature -Name "dns" -IncludeAllSubFeature -IncludeManagementTools  
Add-WindowsFeature -Name "gpmc" -IncludeAllSubFeature -IncludeManagementTools 
REG ADD HKLM\Software\FTCAD /v Data /t Reg_SZ /d "Installed" 
# Windows PowerShell script for AD DS Deployment 
$domainname = "lab.local"  
$netbiosName = "lab"  
$safemodepassword = "Passw0rd" | ConvertTo-SecureString -AsPlainText -Force 
Import-Module ADDSDeployment 
#Promite this PC to Domain Controller
    Import-Module ADDSDeployment
    Install-ADDSForest `
    -DomainName $domainname `
    -SafeModeAdministratorPassword $safemodepassword  `
    -NoRebootOnCompletion `
    -LogPath "C:\Logs.txt" -Force

 
