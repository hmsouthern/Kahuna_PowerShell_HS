exit
#Original Scenario from https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_foreach?view=powershell-5.1 
    $letterArray = "a","b","c","d"
    foreach ($letter1 in $letterArray)
    {
      Write-Host $letter1
      if ($letter1 -eq "B") {Write-host "This is 'B' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
      elseif ($letter1 -eq "d") {Write-host "This is 'd' elsif Statement " -BackgroundColor Black -ForegroundColor Yellow}

    }

#Scenario 1
$ArrayList = "notepad","CALCULATOR","Charmap"
$ArrayTable = Get-Process -Name $ArrayList
Write-Host '$Item is a single row [Array Table] from the $Collection [Array Table]. ' -BackgroundColor Black -ForegroundColor Yellow
foreach ($Item in $ArrayTable){
  Write-Host "
  "
  if ($Item.Name -eq "Notepad") {Write-host "This is 'Notepad' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
  elseif ($Item.Name -eq "Calculator") {Write-host "This is 'Calc' elsif Statement " -BackgroundColor Black -ForegroundColor Yellow}
Pause
}

#Scenario 2
$ArrayList = "notepad","Calculator","charmap"
$Items = Get-Process -Name $ArrayList
foreach ($Item in $Items){
  Write-Host $Item
  if ($Item -eq "Notepad") {Write-host "This is 'Notepad' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
  #if ($Item.Name -eq "Notepad") {Write-host "This is 'Notepad' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
  elseif ($Item.Name -eq "Calculator") {Write-host "This is 'Calc' elsif Statement " -BackgroundColor Black -ForegroundColor Yellow}
Pause
}



#Scenario 3
$ArrayList = "notepad","Calculator","charmap"
$getProc = Get-Process -Name $ArrayList
foreach ($GetIndividualProc in $getProc){
  Write-Host $GetIndividualProc.Name
  #if ($GetIndividualProc -eq "Notepad") {Write-host "This is 'Notepad' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
  #if ($GetIndividualProc.Name -eq "Notepad") {Write-host "This is" $GetIndividualProc.Name "IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
if ($GetIndividualProc.Name -eq "Notepad") {
    if ($GetIndividualProc.Id -ge 7000) {Write-host "     This ID" $GetIndividualProc.id "is equal or greater than 7000" -BackgroundColor Black -ForegroundColor Red }
    elseif ($GetIndividualProc.Id -le 6999 ) {Write-host "     This ID" $GetIndividualProc.id "is less than or equal to 6999" -BackgroundColor Black -ForegroundColor Red }
    Write-host "     This is" $GetIndividualProc.Name "IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
elseif ($GetIndividualProc.Name -eq "Calculator") {Write-host "     This is " $GetIndividualProc.Name " elsif Statement " -BackgroundColor Black -ForegroundColor Yellow}
#Scenario 2
$letterArray = "notepad","Calculator","charmap"
$Collection = Get-Process -Name $letterArray
foreach ($Item in $Collection){
  Write-Host $Item
  if ($Item -eq "Notepad") {Write-host "This is 'Notepad' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
  #if ($Item.Name -eq "Notepad") {Write-host "This is 'Notepad' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
  elseif ($Item.Name -eq "Calculator") {Write-host "This is 'Calc' elsif Statement " -BackgroundColor Black -ForegroundColor Yellow}
Pause
}

}

#Scenario 4
$ArrayList = "notepad","Calculator","charmap"
$getProcs = Get-Process -Name $ArrayList
foreach ($Proc in $getProcs){
  Write-Host $Proc.Name $Proc.Id
  $Proc| Select-Object -Property * | ft
  #if ($Proc -eq "Notepad") {Write-host "This is 'Notepad' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
  if ($Proc.Name -eq "Notepad") {Write-host "     This is" $Proc.id "IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
<#if ($Proc.Name -eq "Notepad") {
    if ($Proc.Id -ge 7000) {Write-host "This ID" $Proc.id "is equal or greater than 7000" -BackgroundColor Black -ForegroundColor Red }
    elseif ($Proc.Id -le 6999 ) {Write-host "This ID" $Proc.id "is less than or equal to 6999" -BackgroundColor Black -ForegroundColor Red }
    Write-host "This is" $Proc.Name "IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
elseif ($Proc.Name -eq "Calculator") {Write-host "This is " $Proc.Name " elsif Statement " -BackgroundColor Black -ForegroundColor Yellow}
#>
pause
}

#Scenario 5
$ArrayList = "notepad","Calculator","charmap"
$Procs = Get-Process -Name $ArrayList
foreach ($Proc in $Procs){
  Write-Host $Proc.Name
  #if ($Proc -eq "Notepad") {Write-host "This is 'Notepad' IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
  #if ($Proc.Name -eq "Notepad") {Write-host "This is" $Proc.Name "IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
if ($Proc.Name -eq "Notepad" -and $Proc.Id -ge 7000) {
    if ($Proc.Id -ge 10000) {Write-host "     This ID" $Proc.id "is equal or greater than 10000" -BackgroundColor Black -ForegroundColor Red }
    elseif ($Proc.Id -le 6999 ) {Write-host "     This ID" $Proc.id "is less than or equal to 6999" -BackgroundColor Black -ForegroundColor Red }
    Write-host "     This is" $Proc.Name "IF Statement " -BackgroundColor Black -ForegroundColor Yellow}
elseif ($Proc.Name -eq "Calculator") {Write-host "     This is " $Proc.Name " elsif Statement " -BackgroundColor Black -ForegroundColor Yellow}
#pause
}