Clear
$GetInitials = $null

do{
Clear
$Counter = 0
$FldrStructure = $null
Write-Host "

        "
Write-Host "Please input your Initials (example:  Rob Krane = RK)" -ForegroundColor Black -BackgroundColor Yellow
Write-Host "
"
$GetInitials = Read-Host 'What are your initials (example:  Rob Krane = RK)'
#$GetInitials
#Start-Sleep -Seconds 3
if ($GetInitials -eq "" -or $GetInitials -eq $null) {
    Write-Host "
    
            " -NoNewline
    Write-Host "You need to provide your initials" -ForegroundColor Yellow -BackgroundColor Black
    Write-Host "
    "
    #Start-Sleep -Seconds 1
    } #If no Initials Provided
else{
    $Counter = 0
    #$FldrStructure = "i"
    $ClassFiles = 'C:\ClassFiles-'
    $Folders = 'DayLabs','Export','Import','Samples'
    $Days = 1..5
    $TestPathClass = Test-Path -Path $ClassFiles$GetInitials -PathType Container
    #$TestPathClass
    #pause
    if ($TestPathClass -eq $false) {
        $FldrStructure = $FldrStructure + $ClassFiles
        New-Item -Path $ClassFiles$GetInitials -ItemType Directory
        } # If $TestPathClass $False
    foreach ($Folder in $Folders ) {
        #$Folder
            $TestPathSub = Test-Path -Path $ClassFiles$GetInitials"\"$Folder -PathType Container
                if ($TestPathSub -eq $false) {
                    $Counter = $Counter + 1
                    $FldrStructure = $FldrStructure + 'S-'+$Folder+", "
                    New-Item -Path $ClassFiles$GetInitials\$Folder -ItemType Directory
                    } #If $Daylab
                 if ($Folder -eq 'Daylabs') {
                    #$Folder
                    foreach ($Day in $Days ) {
                    #$Days
                        $TestPathDay = Test-Path -Path $ClassFiles$GetInitials"\"$Folder"\Day-"$Day -PathType Container
                        if ($TestPathDay -eq $false) {
                            $Counter = $Counter + 1
                            $FldrStructure = $FldrStructure + 'Day-'+$Day+", "
                            New-Item -Path $ClassFiles$GetInitials"\"$Folder"\Day-"$Day -ItemType Directory
                            #Start-Sleep -Milliseconds 500
                            } # TestpathDays $false
                        } # Foreach $Days   
            } # If $TestPathSub $false
        #Start-Sleep -Seconds 1
        } # foreach $Folders
    } # Initials provided
} # Do loop
While ($Counter -le -1 )

if ($Counter -eq 0) {
    Clear

    Write-Host "
    
                   " -NoNewline
    Write-Host $ClassFiles$GetInitials"  " -ForegroundColor Yellow -BackgroundColor Black -NoNewline
    write-host "Structure Already Exists" -ForegroundColor Yellow -BackgroundColor Red
    Write-Host "
    
            "
    } # No folders created, structure exists

else {
    Clear

    Write-Host "
    
            " -NoNewline

    Write-Host $FldrStructure "Class Folder Structure Created" -ForegroundColor Black -BackgroundColor Green
    Write-Host "
    

            "
    } # One or more folders created

Pause
