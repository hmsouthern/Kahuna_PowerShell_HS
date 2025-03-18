

#SCENARIO #1 (CREATING LOG FILE, TEST-PATH, USED DATE/TIME)

<#
Get-Date $startexport | 
Lines 10 & 16
help get-date -Online
#>

$logfile = 'C:\ClassFiles-BK\Export\Logs\LogFile.txt'
$startexport = "Starting the process export procedure"
$endexport = "Finished the process export procedure"

(get-date -format 'mm-dd-yyyy')+"  "+$startexport | Out-File -FilePath C:\ClassFiles-BK\Export\Logs\LogFile.txt -Append
#pause
Get-Process | Select-Object -Property * | Export-Csv -Path C:\ClassFiles-BK\Export\getprocday2.csv -NoTypeInformation
#pause
$TestPathCSV = Test-Path -Path C:\ClassFiles-BK\Export\getprocday2.csv -PathType Leaf
if($TestPathCSV -eq $true){
   $startTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
   $startTime+'  '+$endexport | Out-File -FilePath $logfile -Append
   }

#pause









#SCENARIO #2 (Already completed:  CREATING LOG FILE, TEST-PATH, USED DATE/TIME.  Adding remote CMDlet option.)

<#
Get-Date $startexport | 
Lines 10 & 16
help get-date -Online
#>

$logfile = 'C:\ClassFiles-BK\Export\Logs\LogFile.txt'
$startexport = "Starting the process export procedure"
$endexport = "Finished the process export procedure"
$RemoteSvrs = (Get-ADComputer -Filter 'Name -like "lon-*"' -Properties operatingsystem | Where-Object {$_.operatingsystem -like 'Windows Server*'}).dnshostname


(get-date -format 'mm-dd-yyyy')+"  "+$startexport | Out-File -FilePath C:\ClassFiles-BK\Export\Logs\LogFile.txt -Append
#pause
#Get-Process | Select-Object -Property * | Export-Csv -Path C:\ClassFiles-BK\Export\getprocday2.csv -NoTypeInformation
Get-Process -ComputerName $RemoteSvrs  | Select-Object -Property * | Export-Csv -Path C:\ClassFiles-BK\Export\getprocday2-remote.csv -NoTypeInformation


#pause
$TestPathCSV = Test-Path -Path C:\ClassFiles-BK\Export\getprocday2.csv -PathType Leaf
if($TestPathCSV -eq $true){
   $startTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
   $startTime+'  '+$endexport | Out-File -FilePath $logfile -Append
   }

#pause







#SCENARIO #3 (Already completed:  CREATING LOG FILE, TEST-PATH, USED DATE/TIME.  Adding PSSession option.)

<#
Get-Date $startexport | 
Lines 10 & 16
help get-date -Online
#>

$logfile = 'C:\ClassFiles-BK\Export\Logs\LogFile.txt'
$startexport = "Starting the process export procedure"
$endexport = "Finished the process export procedure"
$RemoteSvrs = (Get-ADComputer -Filter 'Name -like "lon-*"' -Properties operatingsystem | Where-Object {$_.operatingsystem -like 'Windows Server*'}).dnshostname


(get-date -format 'mm-dd-yyyy')+"  "+$startexport | Out-File -FilePath C:\ClassFiles-BK\Export\Logs\LogFile.txt -Append
#pause
#Get-Process | Select-Object -Property * | Export-Csv -Path C:\ClassFiles-BK\Export\getprocday2.csv -NoTypeInformation
Get-Process -ComputerName $RemoteSvrs  | Select-Object -Property * | Export-Csv -Path C:\ClassFiles-BK\Export\getprocday2-remote.csv -NoTypeInformation


#pause
$TestPathCSV = Test-Path -Path C:\ClassFiles-BK\Export\getprocday2.csv -PathType Leaf
if($TestPathCSV -eq $true){
   $startTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
   $startTime+'  '+$endexport | Out-File -FilePath $logfile -Append
   }

#pause 