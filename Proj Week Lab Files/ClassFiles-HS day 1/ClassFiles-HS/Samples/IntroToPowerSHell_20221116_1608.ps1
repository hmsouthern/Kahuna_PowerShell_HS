



# modules > cmdlets > verb-noun

Get-Disk #default table view, 6 properties
Get-Partition #default table view, 5 properties
Get-Volume

Get-NetIPAddress #default list view, 13 properties
Get-NetIPAddress | Format-Table #default table view, 5 properties
Get-NetIPConfiguration
Get-NetIPInterface
Get-NetAdapter

Get-Service #default table view, 3 properties
Get-Service -Name W32Time #default table view, 3 properties for W32time
get-service | Format-List #default list view, 9 properties
Get-Service | Select-Object -Property * #default list view, 14 properties
Get-Service -Name W32Time | Select-Object -Property * 
Get-Service | Select-Object -Property * | Out-GridView
Get-Service -Name W32Time | Select-Object -Property * | Out-GridView

clear
Get-Process
get-process -Name Notepad
get-process -Name Notepad | Select-Object -Property *
get-process -Name Notepad | Select-Object -Property * | Out-GridView

help get-process

update-help

