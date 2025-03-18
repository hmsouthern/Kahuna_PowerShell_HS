#Scenario 6
# Framework of Scenario 5, but used for Get-Service
$ArrayList = "lfsvc","lltdsvc","Spooler"
$Procs = Get-Service -Name $ArrayList
foreach ($Proc in $Procs){
  #Write-Host $Proc.Name
  Write-Host $Proc.Name $Proc.Id
  #if ($Proc -eq "Notepad") {Write-host "This is 'Notepad' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
  #if ($Proc.Name -eq "Notepad") {Write-host "This is" $Proc.Name "IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
if ($Proc.Name -eq "Notepad" -and $Proc.Id -ge 6000) {
    if ($Proc.Id -ge 7000) {Write-host "     This ID" $Proc.id "is equal or greater than 10000" -BackgroundColor Black -ForegroundColor Red }
    elseif ($Proc.Id -le 6999 ) {Write-host "     This ID" $Proc.id "is less than or equal to 6999" -BackgroundColor Black -ForegroundColor Red }
    Write-host "     This is" $Proc.Name "IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
elseif ($Proc.Name -eq "Calculator") {Write-host "     This is " $Proc.Name " elsif Statement " -BackgroundColor Black -ForegroundColor Yellow}
#pause
}
$procs | Select-Object *