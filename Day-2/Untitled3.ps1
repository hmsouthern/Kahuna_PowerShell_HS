


#Declare variables
$logfile = "C:\ClassFiles-HS\Export\Logs"
$startExport = "Starting the process export procedure"
$EndExport = "Process export procedure complete"
$GetDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"



#$startExport 

$GetDate + "   " + $startExport | Out-File -FilePath C:\ClassFiles-HS\Export\Logs\LogFile.txt -Append

pause

#gets the list of processes and exports them to an excel file to keep it in rows and columns, the notype info makes sure it has column headers
Get-Process | Select-Object -Property * | Export-Csv -Path C:\ClassFiles-HS\Export\getprocday2.csv -NoTypeInformation

pause

#Tests whether or  not the file exists
$TestPathCSV = Test-Path -Path C:\ClassFiles-HS\Export\getprocday2.csv -PathType Leaf


#IF statement argument in parentheses and the out file in the curly brackets
if($TestPathCSV -eq $true ) { $GetDate + "   " + $EndExport | Out-File -FilePath $logfile -Append    }
 

 <# Out-File : Access to the path 'C:\ClassFiles-HS\Export\Logs' is denied.
At C:\ClassFiles-HS\DayLabs\Day-2\Untitled2.ps1:29 char:33
+ $GetDate + "   " + $EndExport | Out-File -FilePath $logfile -Append
+                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : OpenError: (:) [Out-File], UnauthorizedAccessException
    + FullyQualifiedErrorId : FileOpenFailure,Microsoft.PowerShell.Commands.OutFileCommand   #>