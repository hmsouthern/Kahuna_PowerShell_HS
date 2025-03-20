



<#EventId 4624 Audit Success/Fail Category Logon
#Define Log File path variable. This path can change based on your environment.
#This path is where the log file will be created and stored.#>

$logFile = C:\ClassFiles-HS\Export\Logs\FailedLogons.txt

#Declare Failed Logon variable
$failedLogon = Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4625 -and $_TimeCreated -ge (Get-Date).AddDays(-1)}

<#Check to see if there are more than 3 failed logon attempts
#Properties for Event ID 4625- relevent index numbers [5]Failed Account Name and [18]Source IP
#>
if ( $failedLogon -ge 3 ) { 
    $eventFail = $failedLogon |
    ForEach-Object {"Time: $($_.TimeCreated) | User: $($_.Properties[5].Value) | IP: $($_.Properties[18].Value)" }
    
    #Export Data
    $eventFail | Out-File -Append -FilePath $logFile

    #Write Output
    Write-Output "Failed logon attempts recorded in $logFile "
    } else{ 
    Write-Output "Failed logon events did not meet the criteria for logging"
    }
