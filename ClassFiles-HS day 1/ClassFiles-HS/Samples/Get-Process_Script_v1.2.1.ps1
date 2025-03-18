
# Revised 8.20.2021/BK
# Script to get ALL and select processes and show only ProcessName and ID on the local computer
# Version History
<#
    1.0 - New script to display processes and color coded values
    1.0.1- Output to a .CSV file ALL information
    1.1 - Select Processes to display
         - Select processes to output to .CSV
    1.1.1 - commented out start-sleep on line 28
    1.2 - dynamic file name for ALL and SELECT exports
        - Verification that file exported and met criteria for ALL and Select 
    1.2.1     1.3   - Add a menu system

Future Improvements or changes
    1.2.3 - Add additional criteria for Select processes


#>

:StartRM
Do {
$Rmval=0
# Declare Main Variables
$GetDate = Get-Date
$GetProc = Get-Process
$ProcDate = Get-Date -UFormat  %Y%m%d_%H%M%S   
$SelectPropInfo=$GetProc | Select-Object -Property ProcessName,Id
$ProcList= Get-Content -Path C:\ClassFiles\DayLabs\Source\ProcessList.txt
$ExpPath = 'C:\ClassFiles\DayLabs\Outputs'
$ExpSelFileNM = 'SelectProcessExport'
$ExpALLFileNM = 'AllProcessExport'
$ExpALLPath = $ExpPath + "\" + $ExpALLFileNM +"_"+ $ProcDate+"_" + $env:COMPUTERNAME+".csv"
$ExpSelPath = $ExpPath + "\" + $ExpSelFileNM +"_"+ $ProcDate+"_" + $env:COMPUTERNAME+".csv"

# Creating variable of select processes
$GetSelProc =@(
foreach($ProcItem1 in $ProcList ){
    $GetProc | Where-Object {$_.processname -eq $ProcItem1}
    #Start-Sleep -Milliseconds 1000
    }
    )

Clear

# Main Body
clear
Write-Host "



     " -NoNewline
Write-Host "What type of report would you like to see and export for Processes? " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
Write-host "(Full = 1, Select = 2) " -ForegroundColor Red -BackgroundColor Black -NoNewline
#Write-host "to GPUPDATE or type " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
Write-Host " QUIT = Q " -ForegroundColor Red -BackgroundColor Black -NoNewline
Write-Host " to end. " -ForegroundColor Yellow -BackgroundColor Black
Write-Host "

"

$inp= Read-Host " >" - # Type of report 

#  $inp
IF ($inp -eq "Q" ){Exit}  # If selection is QUIT
elseif(($inp -eq "1") -or ($inp -eq "2")  ){$Rmval=1}  # If selection is valid




if ($Rmval -eq 1){
    
# ALL Process Chosen    
    if ($inp -eq 1){
    
        # process for ALL
        Write-Host "


        "
        foreach($ProcListItem in $GetProc ){
            Write-Host "         " -NoNewline
            Write-Host $ProcListItem.ProcessName "  " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
            Write-Host $ProcListItem.Id -ForegroundColor Red -BackgroundColor Black
            #Start-Sleep -Milliseconds 100
            }

        Write-Host "

                Exporting ALL process data to a .CSV file..."

        $GetProc | Export-Csv -Path $ExpPath"\"$ExpALLFileNM"_"$ProcDate"_"$env:COMPUTERNAME".csv" -Force -NoTypeInformation #-WhatIf

        <# old method
        Write-Host "

                Export complete."
        #*Start-Sleep -Seconds 15
        #>

        if((Test-Path -Path $ExpALLPath -PathType Leaf).Equals($true)){
            #Get-ItemProperty -Path $ExpALLPath| Where-Object {$_.LastWriteTime -ge $GetDate -and $_.Length -ge 1000}
            if(Get-ItemProperty -Path $ExpALLPath| Where-Object {$_.LastWriteTime -ge $GetDate -and $_.Length -ne 0}){
              Write-Host "

                Export complete." -ForegroundColor Yellow -BackgroundColor Black -NoNewline
                Start-Sleep -Seconds 3 # full script should have 15 seconds
          }
            else{
                Write-Host "File exists, but is not within the timeframe of being created during this script"  -ForegroundColor Yellow -BackgroundColor Black -NoNewline}
            }
        else{write-host "file does NOT exist"  -ForegroundColor Yellow -BackgroundColor Black -NoNewline}
    }    
    
# Select Process Chosen    
    elseif ($inp -eq 2){
    
    # processes for select
        Write-Host "


        "
        foreach($ProcListItem1 in $GetSelProc ){
            Write-Host "         " -NoNewline
            Write-Host $ProcListItem1.ProcessName "  " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
            Write-Host $ProcListItem1.Id -ForegroundColor Red -BackgroundColor Black
            #Start-Sleep -Milliseconds 100
            }

        Write-Host "

                Exporting Select process data to a .CSV file..."

        $GetSelProc | Export-Csv -Path $ExpPath"\"$ExpSelFileNM"_"$ProcDate"_"$env:COMPUTERNAME".csv" -Force -NoTypeInformation #-WhatIf

        <# old method
        Write-Host "

                Export complete."
        #*Start-Sleep -Seconds 15
        #>
        # validation of file export meeting conditions-Select
        if((Test-Path -Path $ExpSelPath -PathType Leaf).Equals($true)){
            #Get-ItemProperty -Path $ExpALLPath| Where-Object {$_.LastWriteTime -ge $GetDate -and $_.Length -ge 1000}
            if(Get-ItemProperty -Path $ExpSelPath| Where-Object {$_.LastWriteTime -ge $GetDate -and $_.Length -ne 0}){
              Write-Host "

                Export complete." -ForegroundColor Yellow -BackgroundColor Black -NoNewline
                Start-Sleep -Seconds 3 # Return to 15 seconds.
          }
            else{
                Write-Host "File exists, but is not within the timeframe of being created during this script"  -ForegroundColor Yellow -BackgroundColor Black -NoNewline}
            }
        else{write-host "file does NOT exist"  -ForegroundColor Yellow -BackgroundColor Black -NoNewline}


    
            }    
    
    
    
            } # Valid selection 
else  # If Selection is NOT valid
{
            $Rmval=2
            Write-Host "
    
            " -NoNewline
            Write-Host " "$inp " " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
            Write-Host " is not a valid selection, press " -ForegroundColor Red -BackgroundColor Black -NoNewline
            Write-Host " ENTER " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
            Write-Host " to try again." -ForegroundColor Red -BackgroundColor Black
            Write-Host "
         "
            Pause
    }

} # do loop
while ($Rmval -ne $null)
# End of Script