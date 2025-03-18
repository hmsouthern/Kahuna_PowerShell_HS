﻿# Create scheduled task for Browser Favorite/Bookmark Backups
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass  -WindowStyle Minimized -File C:\NH\PS\Copy_Favorite-Bookmarks_to_OneDrive.ps1"  -WorkingDirectory "C:\NH\PS"
$trigger = New-ScheduledTaskTrigger -AtLogOn
$trigger.Delay ='PT2M' 
$trigger.ExecutionTimeLimit = 'PT5M'
$principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Users" -RunLevel Limited
$settings = New-ScheduledTaskSettingsSet -Compatibility Win8 -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 5) -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DontStopOnIdleEnd -ExecutionTimeLimit 5 -Priority 8 -StartWhenAvailable
$task = New-ScheduledTask -Description "Backup signed-in user's Edge Chromium Favorites and Google Chrome Bookmarks to their OneDrive" -Action $action -Principal $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask -TaskName "BrowserFavorites_Backup" -InputObject $task -TaskPath \NH -Force