#  DAY 3:  Get Select Processes from a computer
#  Version 1.1 (4.14.2021) 20210415 BK

#  -IMPORTANT:  THERE IS A 'LOT' TO LEARN TO GET PROFICIENT WITH POWERSHELL. 
#  -RESPECTFULLY, IF YOU ARE NEW, INEXPERIENCED OR HAVE "POCKETS OF KNOWLEDGE" WITH POWERSHELL, WHAT YOU LEARN IN THIS CLASS IS 10% OF POWERSHELL'S ABILITIES; AKA, YOU ARE DANGEROUS.
#  -ONLY DO THESE COMMANDS IN A CONTROLLED LAB ENVIRONMENT, SUCH AS THE CLASSROOM LABS WE USED; NOT IN A PRODUCTION (BUSINESS OR PERSONAL) SYSTEM
#   UNTIL YOU ARE THUROUGHLY COMFORTABLE WITH ALL FACITS OF THE COMMANDS, PARAMETERS, PIPES, ETC., THAT YOU ARE USING!!
#  -ENJOY, HAVE FUN AND EXPAND YOUR SKILLS IN POWERSHELL!

# Version 1.0
    #Create Script to retrieve name property values from a text file.
    #Export Data to a CSV file on the local system, appending the file.
# Version 1.1
    #Add date, time and hostname to the export CSV file name

#Variables-NULL
$GPAll = $null #No value 
$ProcListItem = $null
$Number =$null
$CapTime = $null
$CapDate = $null
$CompName = $null


#Variables-Declared
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Force
$GPAll = Get-Process #Task 1
$ProcListSelect = Get-Content -Path C:\Daylabs-BK\ClassFiles\Data\ProcessSelectList.txt
$CompName = $env:COMPUTERNAME
$GPSelectProc = "GP-SelectProcesses"
$GPALLProp = "All-Properties_Export"
$ExportPath = "C:\Daylabs-BK\ClassFiles"
$CompName = $env:COMPUTERNAME
$CapTime = Get-Date -UFormat "%H%M%S" #Process Capture Time
$CapDate = Get-Date -UFormat "%Y%m%d" # P C Date

#$DATE_TIME = Get-Date -UFormat "%Y%m%d_%H%M%S"

clear
#Main body

#$GPName = ($GPAll | Where-Object {$_.ProcessName -eq "Notepad" -or $_.ProcessName -eq "charmap" -or $_.ProcessName -eq "mspaint"})
foreach ($ProcListItem in $ProcListSelect ) { 
   #$GPName = ($GPAll | Where-Object {$_.ProcessName -eq $ProcListItem})[0].Name
   $GPName = ($GPAll | Where-Object {$_.ProcessName -eq $ProcListItem}).Name
   #$ProcListItem
   #Write-Host "There are" $GPName.Count $ProcListItem "Processes running"
   Write-Host "There are " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
   Write-Host ""$GPName.Count ""  -ForegroundColor Yellow -BackgroundColor Red -NoNewline
   Write-Host ""$ProcListItem "" -ForegroundColor Black -BackgroundColor Yellow -NoNewline
   Write-Host "processess running. " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
   <#
   $GPName
   $GPName.Count
   $number = $number +1
   $number
   #>
   #$CapTime = Get-Date -UFormat "%H%M%S" #Process Capture Time
   #$CapDate = Get-Date -UFormat "%Y%m%d" # P C Date

   #$GPAll | Where-Object {$_.ProcessName -eq $ProcListItem} | Select-Object -Property * | Export-Csv -Path C:\Daylabs-BK\ClassFiles\GP-SelectProcesses_All-Properties_Export.csv -Append -NoTypeInformation
   $GPAll | Where-Object {$_.ProcessName -eq $ProcListItem} | Select-Object -Property * | Export-Csv -Path $ExportPath"\"$CompName"_"$CapDate"_"$CapTime"_"$GPSelectProc"_"$GPALLProp".csv" -Append -NoTypeInformation
      Write-Host "Exported" $ProcListItem "Details to .CSV file" -ForegroundColor Black -BackgroundColor Yellow
   Write-Host "
    "
#Pause
   }
Start-Sleep -Seconds 5