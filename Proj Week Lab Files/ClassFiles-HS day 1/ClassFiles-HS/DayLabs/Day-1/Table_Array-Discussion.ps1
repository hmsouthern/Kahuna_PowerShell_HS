


clear
$IMPTable = Import-Csv -Path C:\ClassFiles-HS\Export\exp_getproc-all.csv 
$IMPTable = Get-Content -Path C:\ClassFiles-HS\Export\exp_getproc-all.txt
$IMPTable = Get-Process

$IMPTable
Get-Process | Get-Member #will show you the CMDLet's list of "Member Types", no stored values for properties.
Get-Process | Select-Object -Property * # will show 'command #1', all properties with stored values if there are any
Get-Process | Select-Object -Property * | Out-GridView
Get-Process -
$IMPTable | Select-Object -Property * | FT
$IMPTable | Export-Csv -Path C:\ClassFiles-HS\Export\exp_getproc-all.csv -NoTypeInformation
$IMPTable | Out-File -FilePath C:\ClassFiles-HS\Export\exp_getproc-all-2.txt
$IMPTable | select-object -Property * | Out-File -FilePath C:\ClassFiles-HS\Export\exp_getproc-all-2.txt

$IMPTable.Count #referencing the number of processes, based on what was running when line 5 executed
$IMPTable[0] #refeferences row number of the process
$IMPTable[0].Name #gives you the name of the process on that row
$IMPTable.name 

$IMPTable[1]
$IMPTable[2]
$IMPTable[3]
$IMPTable[27].Name

$sample = $IMPTable[27]
$sample = $IMPTable | Where-Object {$IMPTable.name -eq "Notepad"} #| Out-GridView
$sample = $IMPTable | Where-Object {$_.name -eq "Notepad"} #| Out-GridView
$sample[0]
$sample.name
$sample[0].name

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

