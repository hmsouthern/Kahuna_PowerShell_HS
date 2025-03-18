


clear
$IMPTable = Import-Csv -Path C:\ClassFiles-BK\Export\exp_getproc-all.csv 
$IMPTable = Get-Content -Path C:\ClassFiles-BK\Export\exp_getproc-all-2.txt
$IMPTable = Get-Process

$IMPTable
Get-Process | Get-Member #will show you the CMDLet's list of "Member Types", no stored values for Properties.
Get-Process | Select-Object -Property * #will show 'command #1', all properties with stored values if there are any
Get-Process | Select-Object -Property * | Out-GridView
Get-Process -
$IMPTable | Select-Object -Property *
$IMPTable | Export-Csv -Path C:\ClassFiles-BK\Export\exp_getproc-all.csv -NoTypeInformation
$IMPTable | Out-File -FilePath C:\ClassFiles-BK\Export\exp_getproc-all-2.txt
$IMPTable | Select-Object -Property * | Out-File -FilePath C:\ClassFiles-BK\Export\exp_getproc-all-2.txt

$IMPTable.Count
$IMPTable[0]
$IMPTable[0].Name
$IMPTable.name 

$IMPTable[1]
$IMPTable[2]
$IMPTable[3]
$IMPTable[25]

$sample = $IMPTable[3]
$sample = $IMPTable | Where-Object {$IMPTable.name -eq "Notepad"} | Out-GridView
$sample = $IMPTable | Where-Object {$_.name -eq "Notepad"} #| Out-GridView
$sample[0]
$sample.name
$sample[0].Name


$IMPTable | Select-Object -Property * | Out-GridView
$IMPTable

$IMPTable.'PROCESS-1'
$IMPTable[0].'PROCESS-1'
$IMPTable[0].PROCESS-1
$IMPTable.server
$IMPTable[0.1].SERVER
$IMPTable[0,1]
$IMPTable[0,1].SERVER


$IMPTable[1.2]

