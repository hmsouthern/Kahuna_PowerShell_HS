# Revised 7.2.18/BK
# Version 1.0
# Script to CLOSE RUNNING APPLICATION ON THE LOCAL HOST
#Set-ExecutionPolicy -ExecutionPolicy Bypass
#
#cls
#Write-Host "
# "
#Write-Host "CLOSE ANY OPEN APPLICATIONS AND SAVE ANY FILES BEFORE CONTINUING:" -ForegroundColor White -BackgroundColor Red
#Write-Host "
# "
#Pause
# FIND OPEN APPLICATIONS TO BE CLOSED
#$RnApp1=(Get-Process|Where-Object {$_.path -like "C:\Program Files\WindowsApps\*" -Or $_.path -like "C:\Windows\SystemApps\*" -and $_.processname -ne "LockApp" -and $_.processname -ne "SearchUI" -and $_.processname -ne "ShellExperienceHost"}|ft -Property Name)
#$rnApp2=(Get-Process|Where-Object {$_.path -notlike "C:\Program Files\WindowsApps\*" -and $_.mainwindowtitle -ne "" -and $_.processname -ne "powershell" -and $_.processname -ne "MSASCuiL" -and $_.processname -ne "Flow" -and $_.processname -ne "smartaudio3" -and $_.ProcessName -ne "ApplicationFrameHost"}|ft -Property Name)
#$RnApp3=(Get-Process|Where-Object {$_.path -like "C:\Program Files (x86)'\*"}|ft -Property Name)
#Write-Host " "
#Write-Host "The following applications will be forced closed:" -ForegroundColor White -BackgroundColor Red
#$RnApp1
#$RnApp2
#$rnApp3
#
#Pause
# CLOSE THE OPEN APPLICATIONS--IF SCRIPT IS NOT UAC ELEVATED, SOME APPLICATIONS WILL NOT CLOSE
Get-Process|Where-Object {$_.path -like "C:\Program Files\WindowsApps\*" -Or $_.path -like "C:\Windows\SystemApps\*" -and $_.processname -ne "LockApp" -and $_.processname -ne "SearchUI" -and $_.processname -ne "ShellExperienceHost"}|Stop-Process
Get-Process|Where-Object {$_.path -notlike "C:\Program Files\WindowsApps\*" -and $_.mainwindowtitle -ne "" -and $_.processname -ne "powershell" -and $_.processname -ne "MSASCuiL" -and $_.processname -ne "Flow" -and $_.processname -ne "smartaudio3" -and $_.ProcessName -ne "ApplicationFrameHost"}|Stop-Process
Get-Process|Where-Object {$_.path -like "C:\Program Files (x86)'\*"}|Stop-Process
#Pause
