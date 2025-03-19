



verb-noun

Get-Disk # default table format, 7 properties
Get-Partition # default table format, 5 properties
Get-Volume # default table format, 8 properties

Get-NetAdapter
Get-NetIPAddress # default list format, 13 properties
Get-NetIPConfiguration
Get-NetIPInterface

Get-Service # default table format, 3 properties
Get-Process # default table format, 8 properties
Get-Process -Name Notepad  # notepad, table format, 8 properties
Get-Process | Format-List # FL, list, 5 properties
Get-Process | Select-Object
Get-Process | Select-Object -Property ProcessName
Get-Process | Select-Object -Property *
Get-Process -Name Notepad | Select-Object -Property *
Get-Process -Name Notepad | Select-Object -Property * | Out-GridView
Get-Process | Select-Object -Property * | Out-GridView


help verb-noun -
Update-Help
