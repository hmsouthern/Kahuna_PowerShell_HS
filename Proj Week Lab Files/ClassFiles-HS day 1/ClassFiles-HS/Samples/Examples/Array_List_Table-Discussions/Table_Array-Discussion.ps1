


clear
$IMPTable = Import-Csv -Path C:\ClassFiles\DayLabs\Outputs\AllProcessExport.CSV 
$IMPTable = Get-Content -Path 'C:\ClassFiles\DayLabs\Outputs\AllProcessExport.CSV'

$IMPTable
$IMPTable.Count
$IMPTable[0]
$IMPTable[0].Name
$IMPTable.name 

$IMPTable[1]
$IMPTable[2]
$IMPTable[3]

$sample = $IMPTable[3]
$sample = $IMPTable | Where-Object {$IMPTable.name -eq "Notepad"} | Out-GridView
$sample = $IMPTable | Where-Object {$_.name -eq "Notepad"} #| Out-GridView

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

