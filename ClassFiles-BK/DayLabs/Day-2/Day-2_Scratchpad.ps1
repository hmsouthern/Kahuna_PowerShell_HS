
#Neil
# im trying to incorporate what i have in my project "on $(get date -fromat 'mm-dd-yyyy)
(get-date -format 'mm-dd-yyyy')

(get-date -format 'mm-dd-yyyy')$startexport | Out-File -FilePath C:\ClassFiles-BK\Export\Logs\LogFile.txt -Append
(get-date -format 'mm-dd-yyyy')+$startexport | Out-File -FilePath C:\ClassFiles-BK\Export\Logs\LogFile.txt -Append
(get-date -format 'mm-dd-yyyy')+"  "+$startexport | Out-File -FilePath C:\ClassFiles-BK\Export\Logs\LogFile.txt -Append



# Brandon C.
$startTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$startTime+'  '+$startexport | Out-File -FilePath C:\ClassFiles-BK\Export\Logs\LogFile.txt -Append


Get-ADObject -LDAPFilter:"(anr=lon-)" -Properties:allowedChildClassesEffective,allowedChildClasses,lastKnownParent,sAMAccountType,systemFlags,userAccountControl,displayName,description,whenChanged,location,managedBy,memberOf,primaryGroupID,objectSid,msDS-User-Account-Control-Computed,sAMAccountName,lastLogonTimestamp,lastLogoff,mail,accountExpires,msDS-PhoneticCompanyName,msDS-PhoneticDepartment,msDS-PhoneticDisplayName,msDS-PhoneticFirstName,msDS-PhoneticLastName,pwdLastSet,operatingSystem,operatingSystemServicePack,operatingSystemVersion,telephoneNumber,physicalDeliveryOfficeName,department,company,manager,dNSHostName,groupType,c,l,employeeID,givenName,sn,title,st,postalCode,managedBy,userPrincipalName,isDeleted,msDS-PasswordSettingsPrecedence -ResultPageSize:"100" -ResultSetSize:"20201" -SearchBase:"DC=Adatum,DC=com" -SearchScope:"Subtree" -Server:"LON-DC1.Adatum.com"

Get-ADObject -LDAPFilter:"(objectClass=*)" -Properties:allowedChildClassesEffective,allowedChildClasses,lastKnownParent,sAMAccountType,systemFlags,userAccountControl,displayName,description,whenChanged,location,managedBy,memberOf,primaryGroupID,objectSid,msDS-User-Account-Control-Computed,sAMAccountName,lastLogonTimestamp,lastLogoff,mail,accountExpires,msDS-PhoneticCompanyName,msDS-PhoneticDepartment,msDS-PhoneticDisplayName,msDS-PhoneticFirstName,msDS-PhoneticLastName,pwdLastSet,operatingSystem,operatingSystemServicePack,operatingSystemVersion,telephoneNumber,physicalDeliveryOfficeName,department,company,manager,dNSHostName,groupType,c,l,employeeID,givenName,sn,title,st,postalCode,managedBy,userPrincipalName,isDeleted,msDS-PasswordSettingsPrecedence -ResultPageSize:"100" -ResultSetSize:"20201" -SearchBase:"CN=LON-CL10,CN=Computers,DC=Adatum,DC=com" -SearchScope:"Base" -Server:"LON-DC1.Adatum.com"

Get-ADComputer -Filter
help Get-ADComputer -Online

Get-ADObject -LDAPFilter:"(anr=lon-)" | Select-Object -Property * | Out-GridView

Get-ADComputer -Filter 'Name -like "lon-*"' | Select-Object -Property * | Out-GridView

(Get-ADComputer -Filter 'Name -like "lon-*"').PropertyNames
(Get-ADComputer -Filter 'Name -like "lon-*"').PropertyNames | Select-Object * | Out-GridView
(Get-ADComputer -Filter 'Name -like "lon-*"') | Select-Object -Property propertynames
(Get-ADComputer -Filter 'Name -like "lon-*"') | Select-Object -Property propertynames | Select-Object *
(Get-ADComputer -Filter 'Name -like "lon-*"').operatingsystem
Get-ADComputer -Filter 'Name -like "lon-*"' -Properties operatingsystem
Get-ADComputer -Filter 'Name -like "lon-*"' -Properties operatingsystem | Where-Object {$_.operatingsystem -like 'Windows Server*'}

Get-ADComputer -Identity:"CN=LON-SVR1,CN=Computers,DC=Adatum,DC=com" -Properties:msDS-AssignedAuthNPolicySilo,description,objectClass,displayName,objectSid,location,allowedAttributesEffective,msDS-AssignedAuthNPolicy,operatingSystemServicePack,sDRightsEffective,canonicalName,systemFlags,whenChanged,uSNCreated,operatingSystem,operatingSystemVersion,msDS-AllowedToDelegateTo,sAMAccountName,ntSecurityDescriptor,ProtectedFromAccidentalDeletion,servicePrincipalName,memberOf,managedBy,userAccountControl,whenCreated,primaryGroupID,uSNChanged,dNSHostName -Server:"LON-DC1.Adatum.com"
Get-ADComputer -Identity:"CN=LON-SVR1,CN=Computers,DC=Adatum,DC=com" | Select-Object * | Out-GridView






Test-NetConnection -ComputerName lon-svr1
Test-NetConnection -ComputerName lon-svr1 -CommonTCPPort WINRM

help pssession
help about_pssessions -Online

New-PSSession -ComputerName $RemoteSvrs -Name GetProc
Get-PSSession

Invoke-Command -ComputerName $RemoteSvrs -ScriptBlock {Get-Process} 
Invoke-Command -ComputerName $RemoteSvrs -ScriptBlock {Get-Process} 
Get-Item -

Invoke-Command -ComputerName $RemoteSvrs -ScriptBlock {
    Get-Item C:\
    } 

Remove-PSSession -ComputerName $RemoteSvrs
Get-PSSession


$RemoteSvrs = (Get-ADComputer -Filter 'Name -like "lon-*"' -Properties operatingsystem | Where-Object {$_.operatingsystem -like 'Windows Server*'}).dnshostname


Invoke-Command -ComputerName $RemoteSvrs -ScriptBlock {
    Get-Item C:\
    } 
Get-PSSession

SMB (445)





#Topic is Functions

Get-Command 
get-item -

function Get-PowerShellProcess { Get-Process pwsh }
Get-PowerShellProcess -


#Syntax 1
function [<scope:>]<name> [([type]$parameter1[,[type]$parameter2])]
{
  begin {<statement list>}
  process {<statement list>}
  end {<statement list>}
  clean {<statement list>}
}


#Syntax 2
function [<scope:>]<name>
{
  param([type]$parameter1 [,[type]$parameter2])
  dynamicparam {<statement list>}
  begin {<statement list>}
  process {<statement list>}
  end {<statement list>}
  clean {<statement list>}
}


Function Test-ScriptCmdlet
{
[CmdletBinding(SupportsShouldProcess=$true)]
    Param ($Parameter1)
    begin{}
    process{}
    end{}
}
Test-ScriptCmdlet -Parameter1 Get-Process

function Get-SmallFiles {
  Param($Size)
  Get-ChildItem $HOME | Where-Object {
    $_.Length -lt $Size -and !$_.PSIsContainer
  }
}
Get-SmallFiles -Size 1000


#Modified to work with C:\classfiles-initials
function Get-SmallFiles {
  Param($Size)
  Get-ChildItem C:\ClassFiles-BK -Recurse | Where-Object {
    $_.Length -lt $Size -and !$_.PSIsContainer
  }
}
Get-SmallFiles -Size 1000


[DateTime] $Date

function Get-Date_Func {
  param(
    [DateTime] $Date
  )
  process {
    $Date
  }
}
Get-Date_Func



get-command Get-NetAdapter | Select-Object * | Out-GridView
get-command Get-NetAdapter | Select-Object -Property scriptblock #no result
get-command Get-NetAdapter | Select-Object * | export-csv C:\ClassFiles-BK\Export\get-netadapterfunction-properties.txt -NoTypeInformation
    #IMPORTANT NOTE: 
     <#
        - If you open the .CSV file in Excel, the property values are blank, but they are not; change the font.
        - If you open the .CSV file in Notepad, you will see everything.
        


        #>