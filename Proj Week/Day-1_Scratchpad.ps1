



#5
#DO {doing part
    if (condition){
	    if (condition){doing part} #
	    elseif (condition){
		    if (condition){
			    foreach ($<item> in $<collection>){<statement list>}			
			    doing part
			    } #
		    elseif (condition){doing part} #
		    doing part
		    } #
	    doing part
	    }
    elseif (condition){
        foreach ($<item> in $<collection>){<statement list>}
        doing part
        }
    elseif (condition){doing part}
    elseif (condition){doing part}
    else {doing part}
#} 
#WHILE (condition)

$Folders = 'DayLabs','Export','Import','Samples'
$Days = 1..5


$Folders[2]

Get-Item -Path C:\ClassFiles-BK\Export\exp_getproc-all-2.txt
Get-Item -Path C:\ClassFiles-BK\Export\exp_getproc-all-2.txt | Select-Object -Property * | Out-GridView
$GetDocInfo = Get-Item -Path C:\ClassFiles-BK\Export\exp_getproc-all-2.txt
$GetDocInfo | Select-Object -Property * | Out-GridView


$GetDocInfo.VersionInfo
$GetDocInfo.VersionInfo | Select-Object -Property * | Out-GridView
$GetDocInfo.VersionInfo.FileName
$GetDocInfo.Name



Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -Property * | Out-GridView
Get-WmiObject -Class Win32_Product | Select-Object -Property * | Out-GridView
$GetAppInfo = Get-WmiObject -Class Win32_Product 
$GetAppInfo.properties
$GetAppInfo.name
$GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}
$GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'} | Select-Object -Property * 
($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties
($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties  | Select-Object -Property * 

($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties.name
($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties.packagename
($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties | Where-Object {$_.name -eq 'packagename'}
(($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties | Where-Object {$_.name -eq 'packagename'}).value
($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties | Where-Object {$_.name -eq 'packagename'} | Select-Object -Property value


$GetAppInfo
Write-Host "$getappinfo"
Write-Host '$getappinfo'





Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -Property * | Out-GridView
