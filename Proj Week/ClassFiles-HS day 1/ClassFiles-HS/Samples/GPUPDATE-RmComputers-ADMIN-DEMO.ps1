# Revised 8.30.18/BK
# Version 2.3
# ADMIN Script to INVOKE GPUPDATE on the student computers in a remote classroom.
#Set-ExecutionPolicy -ExecutionPolicy Bypass
# Determine which classroom this is and set variables
:StartRM
Do
{
$Rmval=0
Remove-PSSession -Name winrm*
clear
Write-Host "



     " -NoNewline
Write-Host "Type the room name " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
Write-host "(Emerald, Diamond, Onyx, Pearl, Ruby, Sapphire or Instructor) " -ForegroundColor Red -BackgroundColor Black -NoNewline
Write-host "to GPUPDATE or type " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
Write-Host " QUIT " -ForegroundColor Red -BackgroundColor Black -NoNewline
Write-Host " to end. " -ForegroundColor Yellow -BackgroundColor Black
Write-Host "

"

$inp= Read-Host " >" - # Type in the classroom name
Switch ($inp) 
    {
    EMERALD {
        $ClassABV = "EME"
        $ClassRM = "EMERALD"
        $InstCompNM = "EMEI01"
        $StuCompNM = "EMES"
        $StuCount = 16
        $StuCompsta = Get-Content -Path C:\Windows\Scripts\EMESTUCount.txt
        }
    DIAMOND {
        $ClassABV = "DIA"
        $ClassRM = "DIAMOND"
        $InstCompNM = "DIAI01"
        $StuCompNM = "DIAS"
        $StuCount = 20
        $StuCompsta = Get-Content -Path C:\Windows\Scripts\DIASTUCount.txt
        }
    ONYX {
        $ClassABV = "ONY"
        $ClassRM = "ONYX"
        $InstCompNM = "ONYI01"
        $StuCompNM = "ONYS"
        $StuCount = 20
        $StuCompsta = Get-Content -Path C:\Windows\Scripts\ONYSTUCount.txt
        }
    PEARL {
        $ClassABV = "PRL"
        $ClassRM = "PEARL"
        $InstCompNM = "PRLS01"
        $StuCompNM = "PRLS"
        $StuCount = 20
        $StuCompsta = Get-Content -Path C:\Windows\Scripts\PRLSTUCount.txt
        }
    PLYMOUTH {
        $ClassABV = "PLY"
        $ClassRM = "PEARL"
        $InstCompNM = "PLYI01"
        $StuCompNM = "PLY"
        $StuCount = 6
        $StuCompsta = Get-Content -Path C:\Windows\Scripts\PLYSTUCount.txt
        }
    RUBY {
        $ClassABV = "RUB"
        $ClassRM = "RUBY"
        $InstCompNM = "RUBI01"
        $StuCompNM = "RUBS"
        $StuCount = 12
        $StuCompsta = Get-Content -Path C:\Windows\Scripts\RUBSTUCount.txt
        }
    SAPPHIRE {
        $ClassABV = "SAP"
        $ClassRM = "SAPPHIRE"
        $InstCompNM = "SAPI01"
        $StuCompNM = "SAPS"
        $StuCount = 12
        $StuCompsta = Get-Content -Path C:\Windows\Scripts\SAPSTUCount.txt
        }
    INSTRUCTOR {
        $ClassABV = "INS"
        $ClassRM = "ALL INSTRUCTOR COMPUTERS"
        $InstCompNM = "PRLS01"
        $StuCompNM = "INS"
        $StuCount = 5
        $StuCompsta = Get-Content -Path C:\Windows\Scripts\INSCount.txt
        }
    }
#  $inp
IF ($inp -eq "quit" ){Exit}  # If room name is QUIT

elseif(($inp -eq "EMERALD") -or ($inp -eq "DIAMOND") -or ($inp -eq "ONYX") -or ($inp -eq "PEARL") -or ($inp -eq "PLYMOUTH") -or ($inp -eq "RUBY") -or ($inp -eq "SAPPHIRE") -or ($inp -eq "INSTRUCTOR") ){$Rmval=1}  # If room name is valid

#$Rmval

#Pause 
# Execute the following on the instructor and student computers in the classroom--GPUPDATE
#$ClassRM
#$StuCompsta

    if ($Rmval -eq 1) # If room name is valid
        {
        New-PSSession -ComputerName $StuCompsta
        New-PSSession -ComputerName $InstCompNM
        clear
        clear
        $Rmval
        $inp
        Get-PSSession|Sort-Object -Property computername|ft -Property computername
        $PSSCount = Get-PSSession|Measure-Object|%{$_.Count}
        $STUINSCount=$StuCount+1
        $STUINSCount
        if ($PSSCount -lt $STUINSCount)
            {
            Write-Host "

                *** NOT ALL COMPUTERS ARE ONLINE ***              " -ForegroundColor Red -BackgroundColor Black
            }
        Write-Host "

" 
        Write-Host $PSSCount "out of "$STUINSCount -ForegroundColor Red -BackgroundColor Black -NoNewline
        Write-Host " computers" -ForegroundColor Yellow -BackgroundColor Black -NoNewline
        Write-Host " (Students AND Instructor) " -ForegroundColor Red -BackgroundColor Black -NoNewline
        Write-Host "will" -ForegroundColor Yellow -BackgroundColor Black -NoNewline
        Write-Host " **GPUPDATE** " -ForegroundColor Red -BackgroundColor Black -NoNewline
        Write-Host "in the "  -ForegroundColor Yellow -BackgroundColor Black -NoNewline
        Write-Host $ClassRM -ForegroundColor Red -BackgroundColor Black -NoNewline
        Write-Host " classroom." -ForegroundColor Yellow -BackgroundColor Black
        Write-Host " 
     " -NoNewline
        Write-Host "It will take about 2 minutes for the computers to FULLY GPUPDATE." -ForegroundColor Yellow -BackgroundColor Black
        Write-Host "
        "
        Pause
        Write-Host " 
     " -NoNewline
        Write-Host "UPDATING THE GPO's ON THE STUDENT AND INSTRUCTOR COMPUTERS.......  Almost done." -ForegroundColor Yellow -BackgroundColor Black
        Invoke-Command -ComputerName $StuCompsta -ScriptBlock {Start-ScheduledTask -TaskName GPUPDATE -Verbose}
        Invoke-Command -ComputerName $InstCompNM -ScriptBlock {Start-ScheduledTask -TaskName GPUPDATE -Verbose}
        Start-Sleep -Seconds 5
        Write-Host " "
        Write-Host "                
     " -NoNewline
        Write-Host "PRESS ENTER." -ForegroundColor Red -BackgroundColor Black 
        Remove-PSSession -Name winrm*
        Pause
    }
else  # If room name is NOT valid
    {
    $Rmval=2
    Write-Host "
    
    " -NoNewline
    Write-Host " "$inp " " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
    Write-Host " is not a valid room! Press " -ForegroundColor Red -BackgroundColor Black -NoNewline
    Write-Host " ENTER " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
    Write-Host " to try again." -ForegroundColor Red -BackgroundColor Black
    Write-Host "
 "
    Pause
    }
}
while ($Rmval -ne $null)