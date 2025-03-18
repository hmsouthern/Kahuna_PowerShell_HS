$hash = @{ Number = 1; Shape = "Square"; Color = "Blue"}
$hash
$hash.Keys
$hash.Values
$hash.Number
$hash.Color
$hash["Time"] = "Now"
$hash = $hash + @{Size="Big"}
$t = "Today"
$now = (Get-Date)

$hash.Add($t, $now)

$GetprocValue = Get-Process
$GetProcKey = "AllProc"
$hash.Remove($GetProcKey)
$hash.Add($GetProcKey, $GetprocValue)

Clear
$GetprocNameValue = (Get-Process).ProcessName
$GetprocNameValue = (Get-Process | Select-Object -Unique).ProcessName
$GetProcNameKey = "ProcessName"
$hash.Add($GetProcNameKey, $GetprocNameValue)
$hash.$GetprocValue
$hash.AllProc
$hash.AllProc[8]
($hash.AllProc).processname 
#($hash.AllProc).processname | Where-Object $_.ProcessName -EQ 'notepad'
#($hash.AllProc).processname | Where-Object {$_.ProcessName -EQ 'notepad'}
#($hash.AllProc).processname | Where-Object {($hash.AllProc).processname -EQ 'notepad'}
($hash.AllProc).processname -eq "notepad" | foreach {$hash.values}
($hash.AllProc).processname -eq "notepad" | foreach {$_.values}

($hash.AllProc).processname | foreach {hash.

