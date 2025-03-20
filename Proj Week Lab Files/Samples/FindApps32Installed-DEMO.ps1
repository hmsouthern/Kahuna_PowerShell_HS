# 09.07.18/BK
# Version 2.1
# Display installed applications other than default ones
Invoke-Command -ScriptBlock {
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { #Office #Silverlight #Google Update Helper #7Zip #Adobe Reader DC and Refresh Manager #Chrome #Java
        $_.Caption -notlike 'Java*' -and $_.Caption -notlike 'Microsoft Office*' -and $_.Publisher -notlike 'Google*' -and $_.Publisher -notlike 'Oracle*' -and $_.Publisher -notlike 'Igor*' -and $_.DisplayName -notlike 'Adobe*' -and $_.DisplayName -notlike 'Update*' -and $_.InstallLocation -notlike '*Microsoft Office*' -and $_.ParentKeyName -notlike 'Office16*' -and $_.DisplayName -notlike '*silverlight*' -and $_.PSChildName -notlike 'Connection Manager' -and $_.PSChildName -notlike 'WIC'
        }
}

Invoke-Command -ScriptBlock {
Get-WmiObject -Class Win32_Product | Where-Object { #Office #Silverlight #Google Update Helper #7Zip #Adobe Reader DC and Refresh Manager #Chrome #Java
        #$_.identifyingnumber -eq {90160000-0090-0409-1000-0000000FF1CE}
        $_.identifyingnumber -notlike '{EECB2736-D013*}' -and $_.identifyingnumber -notlike '{90160000*}' -and $_.identifyingnumber -notlike '{89F4137D*}' -and $_.identifyingnumber -notlike '{60EC980A*}' -and $_.identifyingnumber -notlike '{23170F69*}' -and $_.identifyingnumber -notlike '{AC76BA86*}' -and $_.identifyingnumber -notlike '{30D6E9E5*}' -and $_.identifyingnumber -notlike '{26A24AE4*}' 
        }
}

Invoke-Command -ScriptBlock {
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { #Office #Silverlight #Google Update Helper #7Zip #Adobe Reader DC and Refresh Manager #Chrome #Java
        $_.Caption -notlike 'Java*' -and $_.Caption -notlike 'Microsoft Office*' -and $_.Publisher -notlike 'Google*' -and $_.Publisher -notlike 'Alex Feinman' -and $_.Publisher -notlike 'Conexant*' -and $_.Publisher -notlike 'NVIDIA*' -and $_.Publisher -notlike 'Oracle*' -and $_.Publisher -notlike 'Igor*' -and $_.DisplayName -notlike 'Update*' -and $_.InstallLocation -notlike '*Microsoft Office*' -and $_.ParentKeyName -notlike 'Office16*' -and $_.DisplayName -notlike '*silverlight*' -and $_.PSChildName -notlike 'Connection Manager' -and $_.PSChildName -notlike 'WIC'
        }
}
Pause
