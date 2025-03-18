



#modules > cmdlets > verb-noun
clear
Get-Disk #default, table format, 7 properties
get-disk -Number 0 #default, table format, number 0, 7 properties
Get-Partition
Get-Volume

Get-NetAdapter
Get-NetIPAddress #default, list format, 13 properties
Get-NetIPAddress | Format-Table #format-table, table format, 7 properties
Get-NetIPConfiguration
Get-NetIPInterface

Get-Service #default, table format, 3 properties
Get-Service | Select-Object -Property * #Sel-Ob, list format, 16 properties
Get-Service -Name W32Time
Get-Service -Name W32Time | Select-Object -Property *


Get-Process
Get-Process -Name Notepad
Get-Process -Name Notepad | Select-Object -Property *
Get-Process -Name Notepad | Select-Object -Property * | Out-GridView
Get-Process | Select-Object -Property * | Out-GridView






Invoke-Command -ScriptBlock {
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { #Office #Silverlight #Google Update Helper #7Zip #Adobe Reader DC and Refresh Manager #Chrome #Java
 $_.Caption -notlike 'Java*' -and $_.Caption -notlike 'Microsoft Office*' -and $_.Publisher -notlike 'Google*' -and $_.Publisher -notlike 'Oracle*' -and $_.Publisher -notlike 'Igor*' -and $_.DisplayName -notlike 'Adobe*' -and $_.DisplayName -notlike 'Update*' -and $_.InstallLocation -notlike '*Microsoft Office*' -and $_.ParentKeyName -notlike 'Office16*' -and $_.DisplayName -notlike '*silverlight*' -and $_.PSChildName -notlike 'Connection Manager' -and $_.PSChildName -notlike 'WIC'
        }
}

Invoke-Command -ScriptBlock {Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.Caption -notlike 'Java*' -and $_.Caption -notlike 'Microsoft Office*' -and $_.Publisher -notlike 'Google*' -and $_.Publisher -notlike 'Oracle*' -and $_.Publisher -notlike 'Igor*' -and $_.DisplayName -notlike 'Adobe*' -and $_.DisplayName -notlike 'Update*' -and $_.InstallLocation -notlike '*Microsoft Office*' -and $_.ParentKeyName -notlike 'Office16*' -and $_.DisplayName -notlike '*silverlight*' -and $_.PSChildName -notlike 'Connection Manager' -and $_.PSChildName -notlike 'WIC'}}


Invoke-Command -ScriptBlock {Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {
    $_.Caption -notlike 'Java*' -and 
    $_.Caption -notlike 'Microsoft Office*' -and 
    $_.Publisher -notlike 'Google*' -and 
    $_.Publisher -notlike 'Oracle*' -and 
    $_.Publisher -notlike 'Igor*' -and 
    $_.DisplayName -notlike 'Adobe*' -and 
    $_.DisplayName -notlike 'Update*' -and 
    $_.InstallLocation -notlike '*Microsoft Office*' -and 
    $_.ParentKeyName -notlike 'Office16*' -and 
    $_.DisplayName -notlike '*silverlight*' -and 
    $_.PSChildName -notlike 'Connection Manager' -and 
    $_.PSChildName -notlike 'WIC'
    }
}