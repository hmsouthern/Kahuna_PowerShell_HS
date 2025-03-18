Clear
# Declare Variables
$GDate = Get-Date -UFormat  %Y%m%d-%H%M%S # yyyymmdd_hhmmss
$GProcess_ALL = Get-Process
$OutPath = "C:\ClassFiles-BK\Daylabs-BK\Outputs"
$CompName = $env:COMPUTERNAME

#Select Processes
# Defined Select Variables
#$SelectProcessNames = Get-Content -Path C:\ClassFiles-BK\Daylabs-BK\Data_Source\Processes-Select.txt
$SelectProcessHash = Import-Csv -Path C:\ClassFiles-BK\Daylabs-BK\Data_Source\Processes-Select_Hash.csv
$ProcessType = "Process-SELECT"
$EPath = $OutPath+"\"+$GDate+"_"+$CompName+"_"+$ProcessType+".csv"

foreach ($SelProcItem in $SelectProcessHash ) { 
   #$GPName = ($GProcess_ALL | Where-Object {$_.ProcessName -eq $SelProcItem}).Name
   #$GPName = ($GProcess_ALL | Where-Object {$SelProcItem.ProcName -contains $_.ProcessName}).Name #works for Names
   #$GPName = ($GProcess_ALL | Where-Object {$SelProcItem.ProcName -contains $_.ProcessName -and $_.id -le $SelProcItem.id}).Name
   #$GPName = ($GProcess_ALL | Where-Object {{$SelProcItem.ProcName -contains $_.ProcessName} -and {$_.id -le $SelProcItem.id}}).
   $GPName = ($GProcess_ALL | Where-Object {$SelProcItem.ProcName -contains $_.ProcessName -and $_.id -le $SelProcItem.id})
        foreach ($GPNAMEItem in $GPName) {
        Write-Host $GPNAMEItem.ProcessName $GPNAMEItem.id 
        #pause
        }

   #$ProcListItem
   $SelProcItem.ProcessName 
   Write-Host "There are " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
   Write-Host ""$GPName.Count ""  -ForegroundColor Yellow -BackgroundColor Red -NoNewline
   #Write-Host ""$SelProcItem "" -ForegroundColor Black -BackgroundColor Yellow -NoNewline #info from hash table
   Write-Host ""$SelProcItem.ProcName "" -ForegroundColor Black -BackgroundColor Yellow -NoNewline
   Write-Host ""$SelProcItem.ProcName2 "" -ForegroundColor Black -BackgroundColor Yellow -NoNewline

   Write-Host "processess running. " -ForegroundColor Yellow -BackgroundColor Black -NoNewline

   #$GProcess_ALL | Where-Object {$_.ProcessName -eq $ProcListItem} | Select-Object -Property * | Export-Csv -Path C:\Daylabs-BK\ClassFiles\GP-SelectProcesses_All-Properties_Export.csv -Append -NoTypeInformation
 # *  $GProcess_ALL | Where-Object {$_.ProcessName -eq $SelProcItem} | Select-Object -Property * | Export-Csv -Path $EPath -Append -NoTypeInformation
  $GPName | Select-Object -Property * | Export-Csv -Path $EPath -Append -NoTypeInformation

  #$GProcess_ALL | Where-Object {$_.ProcessName -eq $SelProcItem} | Select-Object -Property * | Export-Csv -Path $ExportPath"\"$CompName"_"$CapDate"_"$CapTime"_"$GPSelectProc"_"$GProcess_ALLProp".csv" -Append -NoTypeInformation

   #$GPName | Select-Object -Property * | Export-Csv -Path 'C:\ClassFiles-BK\Daylabs-BK\Outputs\practiceexport-borrowed code_1.csv' -NoTypeInformation

      Write-Host "Exported" $SelProcItem "Details to .CSV file" -ForegroundColor Black -BackgroundColor Yellow
   Write-Host "
    "
Pause
   } #main ForEach
write-host "
    Please wait, exporting file to " $EPath -ForegroundColor Black -BackgroundColor Yellow
Write-Host "
    Export Completed"
Start-Sleep -Seconds 5