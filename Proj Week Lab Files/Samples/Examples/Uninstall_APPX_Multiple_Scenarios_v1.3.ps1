# Multiple scenarios to do the same/similar task (uninstall APPX packages).
# NOTE:  The 'doing action' is commented out of each scenario as to NOT uninstall any applications.
# NOTE:  This is NOT a SCRIPT TO BE RUN.
# version 1.3
pause
exit
# Scenario #1:  Using wildcards for the APPXPackage name(s)
    # Advantages?:
    # Disadvantages?:
$AppxPkgs=@("*windowscommunicationsapps*","*Xbox*","*SkypeApp*","*Microsoft.People*","*Video*","*wallet*","*Zune*","*Advert*","*get*","*feed*","*Solitaire*","*news*","*Tips*","*speedtest*","*Messaging*","*OfficeHub*","*OneConnect*","*mixedreality*","*cortana*" )
foreach($AppxPkg in $AppxPkgs) {
    $AppxPkg
    Get-AppxPackage $AppxPkg #|Remove-AppxPackage -Verbose
    Get-AppxPackage $AppxPkg #|Remove-AppxPackage -AllUsers -Verbose
    #pause
}


# Scenario #2:  Being explicit for the APPXPackage name(s)
    # Advantages?:
    # Disadvantages?:
$AppxPkgs= "Microsoft.MicrosoftSolitaireCollection","Microsoft.GetHelp","Microsoft.Getstarted","Microsoft.Microsoft3DViewer","Microsoft.MicrosoftOfficeHub","Microsoft.People","Microsoft.SkypeApp","microsoft.windowscommunicationsapps","Microsoft.WindowsFeedbackHub","Microsoft.WindowsSoundRecorder","Microsoft.Xbox.TCUI","Microsoft.XboxApp","Microsoft.XboxGameOverlay","Microsoft.XboxGamingOverlay","Microsoft.XboxIdentityProvider","Microsoft.XboxSpeechToTextOverlay","Microsoft.YourPhone","Microsoft.ZuneMusic","Microsoft.Advertising.Xaml"
foreach($AppxPkg in $AppxPkgs) {
    $AppxPkg
    Get-AppxPackage $AppxPkg #|Remove-AppxPackage -Verbose
    Get-AppxPackage $AppxPkg #|Remove-AppxPackage -AllUsers -Verbose
    #pause
}


# Scenario #3:  Using additional 'Properties' to narrow down the APPXPackage(s) to be removed
    # Advantages?:
    # Disadvantages?:

# Understanding the path to the 'doing part' of this scenario
Get-AppxPackage | Select-Object * | Out-GridView
Get-AppxPackage | Where-Object {$_.Isframework -eq $false}| Select-Object -Property Name
Get-AppxPackage | Where-Object {$_.Isframework -eq $false -and $_.NonRemoveable -eq $false } | Select-Object -Property Name,NonRemoveable # Not working 
Get-AppxPackage | Where-Object {$_.NonRemoveable -eq $false} | Select-Object -Property Name,NonRemoveable # Changed the approach to the operator used
Get-AppxPackage | Where-Object {$_.NonRemoveable -ne $true} | Select-Object -Property Name,NonRemoveable
Get-AppxPackage | Where-Object {$_.Isframework -ne $true -and $_.NonRemoveable -ne $true } | Select-Object -Property Name,IsFramework,NonRemoveable
Get-AppxPackage | Where-Object {$_.Isframework -ne $true -and $_.NonRemoveable -ne $true -and $_.SignatureKind -ne 'System' } | Select-Object -Property Name,IsFramework,NonRemoveable,SignatureKind
Get-AppxPackage | Where-Object {$_.Isframework -ne $true -and $_.NonRemoveable -ne $true -and $_.SignatureKind -ne 'Store' } | Select-Object -Property Name,IsFramework,NonRemoveable,SignatureKind
Get-AppxPackage | Where-Object {$_.Isframework -ne $true -and $_.NonRemoveable -ne $true -and $_.SignatureKind -ne 'Store' } | Select-Object -Property Name,IsFramework,NonRemoveable,SignatureKind

# Doing part of this scenario
Get-AppxPackage | Where-Object {$_.Isframework -ne $true -and $_.NonRemoveable -ne $true -and $_.SignatureKind -ne 'Store' } # | Remove-AppxPackage


# Scenario #4:  Combination of scenarios 1 thru 3
    # Advantages?:
    # Disadvantages?:

Clear
#$AppxPkgs=@("*windowscommunicationsapps*","*Xbox*","*SkypeApp*","*Microsoft.People*","*Video*","*wallet*","*Zune*","*Advert*","*get*","*feed*","*Solitaire*","*news*","*Tips*","*speedtest*","*Messaging*","*OfficeHub*","*OneConnect*","*mixedreality*","*cortana*","*phone*","*recorder*","microsoft.zunevideo","*microsoft3d*","*cortana*")
$AppxPkgList= "Microsoft.MicrosoftSolitaireCollection","Microsoft.GetHelp","Microsoft.Getstarted","Microsoft.Microsoft3DViewer","Microsoft.MicrosoftOfficeHub","Microsoft.People","Microsoft.SkypeApp","microsoft.windowscommunicationsapps","Microsoft.WindowsFeedbackHub","Microsoft.WindowsSoundRecorder","Microsoft.Xbox.TCUI","Microsoft.XboxApp","Microsoft.XboxGameOverlay","Microsoft.XboxGamingOverlay","Microsoft.XboxIdentityProvider","Microsoft.XboxSpeechToTextOverlay","Microsoft.YourPhone","Microsoft.ZuneMusic","Microsoft.Advertising.Xaml"
$AppxPkgsInstalled = Get-AppxPackage | Where-Object {$_.NonRemovable -ne '$true' -and $_.IsFramework -ne '$true'} # | Select-Object -Property Name,NonRemovable
$AppxPkgsInstalled = Get-AppxPackage | Where-Object {$_.NonRemovable -ne '$true' -and $_.IsFramework -ne '$true' -and $_.name -notlike "*terminal*" -and $_.name -notlike "*Store*" -and $_.name -notlike "*Edge*" -and $_.name -notlike "*OneDrive*"-and $_.name -notlike "*ImageExt*" -and $_.name -notlike "*Webmedia*"}  | Select-Object -Property Name,NonRemovable

$AppxProvPkgsInstalled = Get-AppxProvisionedPackage -Online  | Select-Object -Property * | Out-GridView
#Get-AppxPackage | Select-Object -Property * | Out-GridView
#Get-AppxProvisionedPackage | Select-Object -Property * | Out-GridView
#$AppxPkgs | Out-GridView

Clear
foreach ($AppxPkgInstalled in $AppxPkgsInstalled){
    #Write-Host $AppxPkgInstalled -ForegroundColor Yellow -BackgroundColor Black
    foreach($AppxPkg in $AppxPkgList) {
            #Write-Host $AppxPkg -ForegroundColor Red -BackgroundColor Black
            if ($AppxPkgInstalled.Name -eq $AppxPkg){
                $AppxPkgName = $AppxPkgInstalled.Name
                $AppxPath = ($AppxPkgInstalled).InstallLocation
                #Write-Host $AppxPkgInstalled.Name "    " -ForegroundColor Black -BackgroundColor Yellow -NoNewline
                Write-Host $AppxPkgName "    " -ForegroundColor Black -BackgroundColor Yellow -NoNewline
                Write-Host "   " $AppxPkg -ForegroundColor Blue -BackgroundColor Yellow
                #$AppxPath = (Get-AppxPackage $AppxPkgInstalled.name).InstallLocation
                Get-AppxPackage -Name '$AppxPkgInstalled.Name'
                #$TP1 = Test-Path -PathType Container '(Get-AppxPackage $AppxPkgInstalled.name).InstallLocation'
                #$TP1 = Test-Path -PathType Container '(Get-AppxPackage $AppxPkgInstalled.name).InstallLocation'
                $TP1 = Test-Path -PathType Container $AppxPath
                #Test-Path -PathType Container 'C:\Program Files\WindowsApps\Microsoft.YourPhone_1.21084.76.0_x64__8wekyb3d8bbwe'
                if ($TP1 -eq $True){
                    Write-Host "      Uninstalling application " -ForegroundColor Red -BackgroundColor Black -NoNewline
                    Write-Host $AppxPkgInstalled.Name -ForegroundColor Yellow -BackgroundColor Black #else
                    #Pause
                    $AppxPkgInstalled #| Remove-AppxPackage
                    #$AppxPkgInstalled | Remove-AppxProvisionedPackage -AllUsers
                    #Get-AppxPackage -Name Microsoft.XboxGameOverlay
                #pause
                    #$TP2 = Test-Path -PathType Container '(Get-AppxPackage $AppxPkgInstalled.Name).InstallLocation'
                    $TP2 = Get-AppxPackage | Where-Object {$_.Name -eq $AppxPkgInstalled.Name}

                    if ($TP2 -eq $false){
                        Write-Host $AppxPkg.Name " was uninstalled." -ForegroundColor Yellow -BackgroundColor Black
                        #pause
                        }# If path false (appx uninstalled)
                    #Pause
                    }#If Appx path exists (Appx installed)
                }# if installed and package list match
        } #foreach appxpkglist
    }#foreach AppxPkgsInstalled 

