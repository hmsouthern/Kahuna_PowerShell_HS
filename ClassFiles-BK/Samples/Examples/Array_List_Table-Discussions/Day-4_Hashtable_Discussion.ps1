$hash = @{}
$hash = @{ Number = 1; Shape = "Square"; Color = "Blue"}


$hash.Keys
$hash.Values

$hash.Keys
$hash.Color

$hash["Time"] = "Now"



$p = @{"PowerShell" = (Get-Process PowerShell);
"Notepad" = (Get-Process notepad)}

$p
$p.Notepad
$p.Notepad.processname
$p.Notepad.processname

#$p.Add('ALL','Get-Process'  )
#$p.Add('ALL',Get-Process  )
$p.Add('ALL',(Get-Process)  )
$p.Remove('all')

$p.ALL
$p.ALL.processname
$q = Get-Process # Array Table
$Folders = 'DayLabs','Export','Import','Samples' #Array list
$ProcList = Get-Content -Path C:\Class_Files-BK\Import\SelectProcList.txt

$Servers = 'LON-DC1','LON-SVR1','LON-CL1' #Array list
$hash1 = @{} # Framework of a hashtable
$hash1.Add('ALL',$q)
$hash1.ALL
$hash1.Add('Folders',$Folders)
$hash1.Remove('folders')
$hash1
$hash1.Folders
$hash1.Add('Servers',$Servers)
$hash1
$hash1.Servers
$hash1.Add('ProcessList',$ProcList)
$hash1
$hash1.ProcessList
$hash1 | Out-GridView
$hash1 | Export-Csv -Path C:\Class_Files-BK\Export\Hash1_Export.csv 
$hash1 | Export-Csv -Path C:\Class_Files-BK\Export\Hash1_Export-1.csv -NoTypeInformation



$hash1.Servers
$hash1.Folders
$hash1.ALL
$hash1.ALL | Select-Object -Property *
$GetProc | Where-Object {$_.ProcessName -eq $ProcListitem} | Export-Csv -Path C:\Class_Files-BK\Export\GetProc_SelectProc_AllProp.csv -NoTypeInformation -Append #-WhatIf
$hash1.ALL | Where-Object {$_.ProcessName -eq 'Notepad'} | Export-Csv -Path C:\Class_Files-BK\Export\GetProc_SelectProc_AllProp.csv -NoTypeInformation -Append #-WhatIf

foreach ( $processlist in $hash1.ProcessList){
    $hash1.ALL | Where-Object {$_.ProcessName -eq $processlist } | Export-Csv -Path C:\Class_Files-BK\Export\Hash1_SelectProcesses.csv -NoTypeInformation -Append #-WhatIf
    Write-Host $processlist
    Start-Sleep -Milliseconds 500

    }


$q.processname