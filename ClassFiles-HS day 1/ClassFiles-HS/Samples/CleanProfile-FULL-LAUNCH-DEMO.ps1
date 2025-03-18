# Revised 7.23.18/BK
# Version 1.2
# Script to CLEANUP the SIGNED-IN profile on a local computer
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
# Execute the following on the  machine in the room.
Remove-PSSession -Name winrm*
$InsNm = $env:USERNAME
$InsNm
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
cls
Write-Host " 

"
Write-Host "BEFORE CLEANING THE" $InsNm " PROFILE, CLOSE ALL OPEN APPLICATIONS (I.E., WORD, EXCEL, POWERPOINT, INTERNET EXPLORER, GOOGLE CHROME, ETC..) and save ANY important files OFF THE COMPUTER before continuing..." -ForegroundColor Yellow -BackgroundColor Black
Write-Host "
"
Pause
cls
Write-Host "
"
Write-Host "THIS WILL TAKE AROUND 5 MINUTES TO DO A ***FULL CLEAN*** THE" $InsNm "PROFILE ON THIS COMPUTER (CLOSE APPLICATIONS, CLEAN, GPUPDATE, RESTART THE COMPUTER)." -ForegroundColor Yellow -BackgroundColor Black  
Write-Host ""
Write-Host "THIS WILL DELETE ALL DATA FILES IN THE" $InsNm -NoNewline -ForegroundColor Yellow -BackgroundColor Black
Write-Host "'s RECENT HISTORY, BROWSER FAVORITES, HISTORY, PASSWORDS, ETC...; OFFICE 2016 SUITE RECENT FILE/FOLDER HISTORY, RESET THE OFFICE TOOLBARS, WORD TEMPLATE AND ADOBE ACROBAT RECENT DOCUMENT/FOLDER HISTORY AND MORE!." -ForegroundColor Yellow -BackgroundColor Black
Write-Host "PRESS ENTER TO **CLEAN** THE" $InsNm " PROFILE ON THIS" $ClassRM " COMPUTER OR [CTRL] -C TO CANCEL" -ForegroundColor Red -BackgroundColor Black  
Write-Host " "
Pause
Write-Host "


"
Write-Host "                                ARE YOU SURE...PRESS ENTER TO CONTINUE OR [CTRL] + C TO CANCEL....?" -ForegroundColor Red -BackgroundColor Black
Pause
#Close Running Apps on the student computer
Write-Host " "
Write-Host "STEP 1 of 4: **CLOSING APPLICATIONS** ....." -ForegroundColor Yellow -BackgroundColor Black  
Start-ScheduledTask -TaskName CloseRunningApps -Verbose
Start-Sleep -Seconds 15
#Clean the SIGNED-IN USERS Profile and more
Write-Host " 
"
Write-Host "STEP 2 of 4: **CLEANING** THE" $InsNm " PROFILE......" -ForegroundColor Yellow -BackgroundColor Black  
Start-ScheduledTask -TaskName INS-ClrProfile-FULL -Verbose
Start-Sleep -Seconds 10
# Update GPO
Write-Host " 
"
Write-Host "STEP 3 of 4: **UPDATING THE GPO'S** ON THE COMPUTER....." -ForegroundColor Yellow -BackgroundColor Black  
Start-ScheduledTask -TaskName GPUPDATE
Start-Sleep -Seconds 30
# Restart the student computer
Write-Host "The profile has been cleaned.  The computer is about to reboot..."
Start-Sleep -Seconds 30
Write-Host " 
"
Write-Host "STEP 4 of 4: **RESTARTING** THE COMPUTER....Almost done." -ForegroundColor Yellow -BackgroundColor Black  
WRITE-HOST ""
Write-Host "RESTARTING THE  COMPUTER IN 15 SECONDS....." -ForegroundColor Yellow -BackgroundColor Black 
Start-Sleep -Seconds 15
Start-ScheduledTask -TaskName Restart-Pre-Clean -Verbose
#CLEANING COMPLETED