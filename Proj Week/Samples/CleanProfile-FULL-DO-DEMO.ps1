# Revised 8.17.18/BK
# Version 2.0
# Script to CLEANUP the SIGNED-IN profile on a local computer
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
# Execute the following on the  machine in the classroom
$InsNm = $env:USERNAME
#Clean the SIGNED-IN USERS Profile and more
Remove-Item -Path C:\Users\$InsNm\Favorites\* -Recurse -Force
New-Item -Path "C:\Users\$InsNm\Favorites\Links" -ItemType Directory
Remove-Item -Path "C:\Users\$InsNm\AppData\Local\Google\Chrome\User Data\Default\bookmarks." -Force
Remove-Item -Path "C:\Users\$InsNm\AppData\Local\Google\Chrome\User Data\Default\bookmarks.bak" -Force
Remove-Item -Path "C:\Users\$InsNm\AppData\Local\Google\Chrome\User Data\Default\preferences." -Force
Remove-Item -Path C:\Users\$InsNm\Contacts\* -Recurse -Force
Remove-Item -Path C:\Users\$InsNm\Desktop\* -Recurse -Force
Remove-Item -Path C:\Users\$InsNm\Downloads\* -Recurse -Force
Remove-Item -Path C:\Users\$InsNm\Documents\* -Recurse -Force
Remove-Item -Path C:\Users\$InsNm\Pictures\* -Recurse -Force
Remove-Item -Path C:\Users\$InsNm\Music\* -Recurse -Force
#sRemove-Item -Path C:\Users\$InsNm\Onedrive\* -Recurse -Force
Remove-Item -Path C:\Users\$InsNm\AppData\Local\Temp\* -Recurse -Force
Remove-Item -Path C:\Windows\Temp\* -Recurse -Force
Remove-Item -Path "C:\Users\$InsNm\Saved Games\*" -Recurse -Force
Remove-Item -Path C:\Users\$InsNm\Videos\* -Force -Recurse
Remove-Item -Path "C:\Users\$InsNm\3D Objects\*" -Recurse -Force
Remove-Item -Path C:\Classfiles\* -Recurse -Force
Remove-Item -Path C:\Shared\* -Recurse -Force
Remove-Item -Path "C:\Users\$InsNm\*.doc*" -Force
Remove-Item -Path C:\Users\$InsNm\*.pdf -Force
Remove-Item -Path "C:\Users\$InsNm\*.xls*" -Force
Remove-Item -Path "C:\Users\$InsNm\*.ppt*" -Force
Remove-Item -Path C:\Users\$InsNm\*.txt -Force
Remove-Item -Path C:\Users\$InsNm\*.rtf -Force
Remove-Item -Path C:\Users\$InsNm\*.xml -Force
Remove-Item -Path C:\Users\$InsNm\*.url -Force
Remove-Item -Path C:\Users\$InsNm\*.website -Force
Remove-Item -Path C:\Users\$InsNm\*.mp3 -Force
Remove-Item -Path C:\Users\$InsNm\*.mp4 -Force
Remove-Item -Path C:\Users\$InsNm\*.zip -Force
Remove-Item -Path C:\Users\$InsNm\*.rar -Force
Remove-Item -Path C:\Users\$InsNm\*.jpg -Force
Remove-Item -Path C:\Users\$InsNm\*.bmp -Force
Remove-Item -Path C:\Users\$InsNm\*.png -Force
Remove-Item -Path C:\Users\$InsNm\*.gif -Force
Remove-Item -Path "C:\Users\$InsNm\*.tif*" -Force
Remove-Item -Path C:\Users\$InsNm\*.ps1 -Force
Remove-Item -Path "C:\Users\$InsNm\*.htm*" -Force
Remove-Item -Path C:\Users\$InsNm\*.ht -Force
Remove-Item -Path C:\Users\$InsNm\*.mht -Force
Remove-Item -Path C:\Users\$InsNm\*.reg -Force
Remove-Item -Path C:\Users\$InsNm\*.onepkg -Force
Remove-Item -Path C:\Users\$InsNm\*.cmd -Force
Remove-Item -Path C:\Users\$InsNm\*.exe -Force
Remove-Item -Path C:\Users\$InsNm\*.msi -Force
Remove-Item -Path C:\Users\$InsNm\*.bat -Force
Remove-Item -Path C:\Users\$InsNm\*.cmd -Force
Remove-Item -Path C:\Users\$InsNm\*.csv -Force
Remove-Item -Path C:\Users\$InsNm\AppData\Local\Microsoft\Office\*.officeUI -Force
Remove-Item -Path C:\Users\$InsNm\AppData\Roaming\Microsoft\Templates\*.dotm -Force
Remove-Item -Path "C:\Users\$InsNm\AppData\Roaming\Microsoft\Windows\Network Shortcuts\*" -Recurse -Force
Remove-Item -Path "C:\Users\$InsNm\AppData\Roaming\Microsoft\Windows\Printer Shortcuts\*" -Recurse -Force
Remove-Item -Path "C:\Users\$InsNm\AppData\Roaming\Microsoft\Windows\Recent\*" -Recurse -Force
Remove-Item -Path "C:\Users\$InsNm\AppData\Local\Microsoft\Windows\History\*" -Recurse -Force
Remove-Item -Path "C:\Windows\Scripts\StartTaskbarlayoutSTU.xml" -Force
# Remove recent items from Microsoft Office 2016 Suite
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Access\File MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Access\Place MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Excel\File MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Excel\Place MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Excel\options\' -Recurse -Force
New-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Excel\options' -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\MS Project\File MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\MS Project\Place MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\PowerPoint\File MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\PowerPoint\Place MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\PowerPoint\options\' -Recurse -Force
New-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\PowerPoint\options' -Force
New-ItemProperty -Path hkcu:\Software\Microsoft\Office\16.0\PowerPoint\options -Name UseMonMgr -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path hkcu:\Software\Microsoft\Office\16.0\PowerPoint\options -Name Ruler -Value 0 -PropertyType DWORD -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\publisher\File MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\publisher\Place MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Word\File MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Word\Place MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Word\Reading Locations\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Word\Options\' -Recurse -Force
Remove-ItemProperty -Path hkcu:\Software\Microsoft\Office\16.0\Word\Options -Name DisplayAlignmentGuides -Force
Remove-ItemProperty -Path hkcu:\Software\Microsoft\Office\16.0\Word\Options -Name Ruler -Force
Remove-ItemProperty -Path hkcu:\Software\Microsoft\Office\16.0\Word\Data -Name Toolbars -Force
Remove-ItemProperty -Path hkcu:\Software\Microsoft\Office\16.0\Word\Data -Name Settings -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\Common\Toolbars\' -Recurse -Force 
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\visio\File MRU\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Microsoft\Office\16.0\visio\Place MRU\' -Recurse -Force
Remove-Item -Path C:\Users\$InsNm\AppData\Local\Microsoft\Office\*.officeUI -Force
Remove-Item -Path C:\Users\$InsNm\AppData\Local\Microsoft\Office\*.customUI -Force
Remove-Item -Path C:\Users\$InsNm\AppData\Roaming\Microsoft\Templates\*.dotm -Force
# Remove recent items from Adobe Acrobat DC
Remove-Item -Path 'hkcu:\Software\Adobe\Acrobat Reader\DC\AVGeneral\cRecentFiles\' -Recurse -Force
Remove-Item -Path 'hkcu:\Software\Adobe\Acrobat Reader\DC\AVGeneral\cRecentFolders\' -Recurse -Force
# Add I.E. 11 favorites bar items to current user profile
Copy-Item -Path "C:\Tools\IEFavorites\*.URL" -Destination "C:\Users\$InsNm\Favorites\Links\" -Recurse -Force
# Add Chrome favorites bar items to current user profile
Copy-Item -Path "\\nhwds2\sysuser$\Scripts\Bookmarks." -Destination "C:\Users\$InsNm\AppData\Local\Google\Chrome\User Data\Default\bookmarks." -Force
Copy-Item -Path "\\nhwds2\sysuser$\Scripts\PreferencesStu." -Destination "C:\Users\$InsNm\AppData\Local\Google\Chrome\User Data\Default\preferences." -Force
Start-Sleep -Seconds 5
clear
Write-Host "

    Almost done cleaning the"$InsNm" profile...  Updating Group Policies."
Start-Sleep -Seconds 5
Start-ScheduledTask -TaskName GPUPDATE

Write-Host "

    Finished Cleaning the  Profile" -ForegroundColor Yellow -BackgroundColor Black 
Start-Sleep -Seconds 15
# Cleaning Completed