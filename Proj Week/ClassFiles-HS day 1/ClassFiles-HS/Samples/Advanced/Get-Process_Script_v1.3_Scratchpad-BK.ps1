



#  DAY 5:  Get-Process_Script_v1.3-BK
#  Version 1.3 (7.2.2021)

#  -IMPORTANT:  THERE IS A 'LOT' TO LEARN TO GET PROFICIENT WITH POWERSHELL. 
#  -RESPECTFULLY, IF YOU ARE NEW, INEXPERIENCED OR HAVE "POCKETS OF KNOWLEDGE" WITH POWERSHELL, WHAT YOU LEARN IN THIS CLASS IS 10% OF POWERSHELL'S ABILITIES; AKA, YOU ARE DANGEROUS.
#  -ONLY DO THESE COMMANDS IN A CONTROLLED LAB ENVIRONMENT, SUCH AS THE CLASSROOM LABS WE USED; NOT IN A PRODUCTION (BUSINESS OR PERSONAL) SYSTEM
#   UNTIL YOU ARE THUROUGHLY COMFORTABLE WITH ALL FACITS OF THE COMMANDS, PARAMETERS, PIPES, ETC., THAT YOU ARE USING!!
#  -ENJOY, HAVE FUN AND EXPAND YOUR SKILLS IN POWERSHELL!

# Version History
<#
Version 1.0
    *- Basic output to host for ALL and SELECT Processes.  Depends on console allowing "currentuser" with "Local" or "Bypass" 

Version 1.1
    *- Export to CSV for ALL and SELECT Processes (to separate files)

Version 1.2
    *- Count # of processes for each type of process and display on the host

Version 1.3
    - For SELECT:  Only processes that meet specific requirements

Version 2.0
    - Create a menu to select type of activity (ALL or SELECT).
#>

Clear
#Set-ExecutionPolicy -Scope UserPolicy -ExecutionPolicy 
# Declare Variables
$GDate = Get-Date -UFormat  %Y%m%d-%H%M%S # yyyymmdd_hhmmss
$GProcess_ALL = Get-Process
$OutPath = "C:\ClassFiles-BK\Daylabs-BK\Outputs"
$CompName = $env:COMPUTERNAME
$SelectProcessNames = Get-Content -Path C:\ClassFiles-BK\Daylabs-BK\Data_Source\Processes-Select.txt
$GProcess_SELECT = Get-Process -Name $SelectProcessNames

# Main Body

#All Processes

$ProcessType = "Process-ALL"
$EPath = $OutPath+"\"+$GDate+"_"+$CompName+"_"+$ProcessType+".csv"

Write-Host "

    " -NoNewline
Write-Host "Information for ALL Processes (ProcessName & Process ID)" -ForegroundColor Yellow -BackgroundColor DarkGreen
Write-Host "Capture date and time (yyyymmdd_hhmmss)" -NoNewline
Write-Host $GDate -ForegroundColor Black -BackgroundColor Yellow
foreach ($GP_All in $GProcess_ALL) { 
    Write-Host $GP_All.ProcessName -ForegroundColor Red -BackgroundColor Black -NoNewline
    Write-Host " "$GP_All.Id -ForegroundColor Yellow -BackgroundColor DarkGray 
    } #foreach loop
write-host "
    Please wait, exporting file to " $EPath -ForegroundColor Black -BackgroundColor Yellow
$GProcess_ALL | Select-Object -Property * | Export-Csv -Path $EPath -NoTypeInformation
Write-Host "
    Export Completed"
Start-Sleep -Seconds 5

#Select Processes
# Defined Select Variables
$SelectProcessNames = Get-Content -Path C:\ClassFiles-BK\Daylabs-BK\Data_Source\Processes-Select.txt
$SelectProcessHash = Import-Csv -Path C:\ClassFiles-BK\Daylabs-BK\Data_Source\Processes-Select_Hash.csv

$ProcessType = "Process-SELECT"
$EPath = $OutPath+"\"+$GDate+"_"+$CompName+"_"+$ProcessType+".csv"
Get-WmiObject Win32_Process -Filter "name='calculator.exe'" | Select Name, @{Name="UserName";Expression={$_.GetOwner().Domain+"\"+$_.GetOwner().User}}
Get-WmiObject Win32_Process -Filter "name='$SelProcItem'" | Select Name, @{Name="UserName";Expression={$_.GetOwner().Domain+"\"+$_.GetOwner().User}}
Get-WmiObject Win32_Process -Filter "name='$SelProcItem'" | Select Name, @{Name="UserName";Expression={$_.GetOwner().User}}



foreach ($SelProcItem in $SelectProcessNames ) { }
   $GPName = ($GProcess_ALL | Where-Object {$_.ProcessName -eq $SelProcItem}).Name
   $GPName = ($GProcess_ALL | Where-Object {$_.ProcessName -eq $SelProcItem}) 
   
   Where-Object {(Get-WmiObject Win32_Process -Filter "name='$SelProcItem'" | Select Name, @{Name="UserName";Expression={$_.GetOwner().User}}).username -contains $env:USERNAME}
  `
    
    #$ProcListItem
   Write-Host "There are " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
   Write-Host ""$GPName.Count ""  -ForegroundColor Yellow -BackgroundColor Red -NoNewline
   Write-Host ""$SelProcItem "" -ForegroundColor Black -BackgroundColor Yellow -NoNewline
   Write-Host "processess running. " -ForegroundColor Yellow -BackgroundColor Black -NoNewline

   #$GProcess_ALL | Where-Object {$_.ProcessName -eq $ProcListItem} | Select-Object -Property * | Export-Csv -Path C:\Daylabs-BK\ClassFiles\GP-SelectProcesses_All-Properties_Export.csv -Append -NoTypeInformation
  #*$GProcess_ALL | Where-Object {$_.ProcessName -eq $SelProcItem} | Select-Object -Property * | Export-Csv -Path $EPath -Append -NoTypeInformation
  #$GProcess_ALL | Where-Object {$_.ProcessName -eq $SelProcItem} | Select-Object -Property * | Export-Csv -Path $ExportPath"\"$CompName"_"$CapDate"_"$CapTime"_"$GPSelectProc"_"$GProcess_ALLProp".csv" -Append -NoTypeInformation

   #$GPName | Select-Object -Property * | Export-Csv -Path 'C:\ClassFiles-BK\Daylabs-BK\Outputs\practiceexport-borrowed code_1.csv' -NoTypeInformation

      Write-Host "Exported" $SelProcItem "Details to .CSV file" -ForegroundColor Black -BackgroundColor Yellow
   Write-Host "
    "
#Pause
   }
write-host "
    Please wait, exporting file to " $EPath -ForegroundColor Black -BackgroundColor Yellow
Write-Host "
    Export Completed"
Start-Sleep -Seconds 5



# End of Script