

**  Use caution, the following commands will 'do' something, such as stop/start or end/kill processes or services.**
#Scenario 6

$Svcs = Get-Service
$Svcs | Select-Object *
$Svcs | Select-Object * | Out-GridView

$Svcs.status | Where-Object {$_.status -eq "stopped"}
$Svcs | Where-Object {$_.status -eq "stopped"}
$Svcs | Where-Object {$_.status -eq "stopped" -and $_.Name -like "XB*"}

$Svcs | Where-Object {$_.status -eq "stopped" -and $_.Name -like "winrm"} # risk if there are multiple services that start with WinRM.
$Svcs | Where-Object {$_.status -eq "stopped" -and $_.Name -eq "winrm" }

Get-Service | Where-Object {$_.status -eq "stopped" -and $_.Name -eq "winrm"}
Get-Service | Where-Object {$_.status -eq "stopped" -and $_.Name -eq "winrm"} | Start-Service -WhatIf
(Get-Service | Where-Object {$_.status -eq "stopped" -and $_.Name -eq "winrm" }).Start()
(Get-Service | Where-Object {$_.status -eq "running" -and $_.Name -eq "winrm" }).Stop()
verb-noun | Get-Member
Get-Service | Get-Member


#Scenario 7 
Get-Process | Get-Member

Stop-Process -Name notepad -WhatIf
Get-Process -Name notepad
Get-Process -Name notepad -ErrorAction Ignore
Start-Process -FilePath C:\Windows\System32\notepad.exe

# Adjust the .ID value to work with the processes you have running
# Task: Open (5) Notepads and type something into each one but don't save them to a file.
Get-Process | Where-Object {$_.ProcessName -eq "Notepad" -and $_.id -ge 5000}
Get-Process | Where-Object {$_.ProcessName -eq "Notepad" -and $_.id -ge 5000} | Stop-Process
(Get-Process | Where-Object {$_.ProcessName -eq "Notepad" -and $_.id -ge 5000}).Kill() #Kills/terminates process(es)
(Get-Process | Where-Object {$_.ProcessName -eq "Notepad" -and $_.id -ge 5000}).Close() #Prompts to save 
(Get-Process | Where-Object {$_.ProcessName -eq "Notepad" -and $_.id -ge 5000}).CloseMainWindow() #Prompts to save

#Scenario 8
New-Item -Path C:\ClassFiles-BK\Files -ItemType Directory -Force
$FileNumbers = 1..10
$FileNames = "Text","picture","music"
$FileExts = "jpg","mpg","doc","pdf"

    foreach ($FileNumber in $FileNumbers) {
        foreach ($FileName in $FileNames){
            foreach ($FileExt in $FileExts){
                $FileSize = Get-Random -Minimum 1000 -Maximum 70000000
                $name = "$FileName$FileNumber.$FileExt"
                fsutil file createnew C:\ClassFiles-BK\Files\$name $FileSize

                }
            }
        
        }
    $
    fsutil file createnew C:\ClassFiles-BK\Files\text.txt 42398
    fsutil file createnew C:\ClassFiles-BK\Files\text2.txt 6215
    fsutil file createnew C:\ClassFiles-BK\Files\picture.jpg 582398
    fsutil file createnew C:\ClassFiles-BK\Files\MUSIC.MPG 2217
    }



Get-Item -Path C:\ClassFiles-BK
Get-Item -Path C:\ClassFiles-BK\*
Get-ChildItem -Path C:\ClassFiles-BK
Get-ChildItem -Path C:\ClassFiles-BK -Recurse
Get-ChildItem -Path C:\ClassFiles-BK -Include *.mpg



