


#Declare variables
$logfile = "C:\ClassFiles-HS\Export\Logs"
$startExport = "Starting the process export procedure"
$EndExport = "Process export procedure complete"
$GetDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

#$startExport | Out-File -FilePath C:\ClassFiles-HS\Export\Logs\LogFile.txt -Append

$GetDate + "   " + $startExport | Out-File -FilePath C:\ClassFiles-HS\Export\Logs\LogFile.txt -Append

pause

#gets the list of processes and exports them to an excel file to keep it in rows and columns, the notype info makes sure it has column headers
Get-Process | Select-Object -Property * | 
Export-Csv -Path C:\ClassFiles-HS\Export\getprocday2.csv -NoTypeInformation

pause

#Tests whether or  not the file exists
$TestPathCSV = Test-Path -Path C:\ClassFiles-HS\Export\getprocday2.csv -PathType Leaf

#IF statement argument in parentheses and the out file in the curly brackets
if($TestPathCSV -eq $true ) { 
$GetDate + "   " + $EndExport | Out-File -FilePath $logfile -Append                            
                             }
 
#$EndExport | Out-File -FilePath $logfile -Append

#help Get-Date -Online

