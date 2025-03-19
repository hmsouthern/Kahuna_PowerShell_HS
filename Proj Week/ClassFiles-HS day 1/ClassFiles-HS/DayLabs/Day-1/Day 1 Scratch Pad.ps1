



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

Get-Item -Path C:\ClassFiles-HS\Export\exp_getproc-all-2.txt
Get-Item -Path C:\ClassFiles-HS\Export\exp_getproc-all-2.txt | Select-Object -Property * | Out-GridView
$GetDocInfo = Get-Item -Path C:\ClassFiles-HS\Export\exp_getproc-all-2.txt
$GetDocInfo | Select-Object -Property * | Out-GridView

$GetDocInfo.VersionInfo
$GetDocInfo.Name
$GetDocInfo.VersionInfo | Select-Object -Property * | Out-GridView
$GetDocInfo.GetHashCode()
$GetDocInfo.VersionInfo.FileName

Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -Property * | Out-GridView
get-WmiObject -Class Win32_Product | Select-Object -Property * | Out-GridView
$GetAppInfo = get-WmiObject -Class Win32_Product
$GetAppInfo.properties 
$GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}

$GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'} | Select-Object -Property *


($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties
($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties | Select-Object -property *
($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties.name
($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties | Where-Object {$_.name -eq 'PackageName' }
(($GetAppInfo | Where-Object {$_.name -like '*PowerShell 7*'}).properties | Where-Object {$_.name -eq 'PackageName' }).value

$GetAppInfo
Write-Host "$GetAppInfo"
Write-Host '$GetAppInfo'



