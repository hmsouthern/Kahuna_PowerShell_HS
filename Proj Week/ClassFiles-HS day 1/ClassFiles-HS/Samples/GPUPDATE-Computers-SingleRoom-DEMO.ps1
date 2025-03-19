# Revised 8.27.18/BK
# Version 2.1
# Script to INVOKE GPUPDATE the  computers in a room.
#Set-ExecutionPolicy -ExecutionPolicy Bypass
# Determine which room this is and set variables
Remove-PSSession -Name winrm*
Switch ($env:COMPUTERNAME) 
{
     EMUI01 {
        $ClassABV = "EMU"
        $ClassRM = "EMU"
        $InsCompNM = "EMUI01"
        }
    WHYI01 {
        $ClassABV = "WHY"
        $ClassRM = "WHY"
        $InstCompNM = "WHYI01"
         }
    NOTI01 {
        $ClassABV = "NOT"
        $ClassRM = "NOT"
        $InstCompNM = "NOTI01"
         }
  }
# Execute the following on each  machine in the room--GPUPDATE
New-PSSession -ComputerName $StuCompsta
cls
#Determine the number of PSSessions created
Get-PSSession|Sort-Object -Property computername|ft -Property computername
$PSSCount = Get-PSSession|Measure-Object|%{$_.Count}
# Are all computers online and connected?
if ($PSSCount -lt $StuCount){
    Write-Host "

    WARNING:  Not all computers are online

" -ForegroundColor White -BackgroundColor Red
}
Write-Host $PSSCount "out of" $StuCount "computers will  **GPUPDATE** in the" $ClassRM "room." -ForegroundColor Yellow -BackgroundColor Black
Write-Host " 
"
Write-Host "It will take about 3 minutes to update the Group Policies on the  computers." -ForegroundColor White -BackgroundColor Black 
Write-Host " 
"
Write-Host "PRESS" -ForegroundColor White -BackgroundColor Black -NoNewlin
Write-Host " ENTER to **GPUPDATE** " -ForegroundColor Red -BackgroundColor Black -NoNewline
Write-Host "the  computers in the" -ForegroundColor White -BackgroundColor Black -NoNewline 
Write-Host ""$ClassRM" " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
Write-Host "room." -ForegroundColor White -BackgroundColor Black -NoNewline
Write-Host " OR PRESS" -ForegroundColor White -BackgroundColor Black -NoNewline
WRITE-HOST " [CTRL] + C TO CANCEL." -ForegroundColor Red -BackgroundColor Black
Write-Host " " 
Pause
Write-Host " "
Write-Host " "
Write-Host "GPO'S UPDATING on the  computers.....almost done." -ForegroundColor Yellow -BackgroundColor Black 
Write-Host " "
Invoke-Command -ComputerName $StuCompsta -ScriptBlock {Start-ScheduledTask -TaskName GPUPDATE -Verbose} #Update s
Invoke-Command {Start-ScheduledTask -TaskName GPUPDATE -Verbose} #Update Instructor
Start-Sleep -Seconds 5
Write-Host " "
Write-Host "It will take about 3 minutes to complete.  PRESS ENTER TO END THIS SCRIPT." -ForegroundColor Red -BackgroundColor Black
Remove-PSSession -Name winrm*
Pause
