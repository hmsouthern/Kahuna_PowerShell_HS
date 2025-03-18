#Scenario 8
New-Item -Path C:\ClassFiles-BK\Files -ItemType Directory -Force
$FileNumbers = 1..10
$FileNames = "Text","picture","music"
$FileExts = "jpg","mpg","doc","pdf"

    foreach ($FileNumber in $FileNumbers) {
        foreach ($FileName in $FileNames){
            foreach ($FileExt in $FileExts){
                $FileSize = Get-Random -Minimum 10000 -Maximum 70000000
                $name = "$FileName$FileNumber.$FileExt"
                fsutil file createnew C:\ClassFiles-BK\Files\$name $FileSize 

                }
            }
        
        }

Get-Item -Path C:\ClassFiles-BK\
Get-Item -Path C:\ClassFiles-BK\*
Get-ChildItem -Path C:\ClassFiles-BK
Get-ChildItem -Path C:\ClassFiles-BK -Recurse
Get-ChildItem -Path C:\ClassFiles-BK -Include *.mpg
Get-ChildItem -Path C:\ClassFiles-BK -Recurse -Include *.mpg

Get-ChildItem -Path C:\ClassFiles-BK -Recurse -Include *text*
Get-ChildItem -Path C:\ClassFiles-BK -Recurse -Include *text*
Get-ChildItem -Path C:\ClassFiles-BK -Recurse -Include *text* | Select-Object * | Out-GridView

Get-ChildItem -Path C:\ClassFiles-BK -Recurse -Include *text* | Where-Object {$_.Length -le 50000}
Get-ChildItem -Path C:\ClassFiles-BK -Recurse -Include *text* | Where-Object {$_.Length -le 5000000}
Get-ChildItem -Path C:\ClassFiles-BK -Recurse -Include *text* | Where-Object {$_.Length -le 50000000}

