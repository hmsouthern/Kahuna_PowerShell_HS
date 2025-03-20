# Foundation of "Foreach" loop
Foreach (Condition) {Statement Block "Doing Part"}
Foreach ($Item in $List){doing part}


$ProcessList = "Notepad","Charmap","mspaint"
$ProcessList
Start-Sleep -Seconds 2
clear

foreach ($ProcessItem in $ProcessList){
	Write-Host $ProcessItem

	if ($ProcessItem -eq "Charmap") {
        Write-Host "Charmap selected
        " -ForegroundColor Black -BackgroundColor Green
        }
    else {
        Write-Host "NOT Charmap
        " -ForegroundColor Red -BackgroundColor Black
        }
    Pause
    }




# Exercise 1 from About_foreach
$letterArray = "a","b","c","d"
foreach ($letter in $letterArray)
{
  Write-Host $letter
}

# Exercise 2 from About_foreach
$letterArray = "a","b","c","d"
foreach ($letter in $letterArray)
{
  Write-Host $letter
  Pause
}

# Exercise 1 based on About_foreach
$letterArray = 1,2,3
foreach ($letter in $letterArray){
  Write-Host $letter
  Pause
}

# Framework example #1
foreach(){
    
    
    }
if(){}



# Framework example #2
$letterArray = 1,2,3
foreach($letter in $letterArray){
    #if(){}
    Write-Host $letter
    Pause

    
    } #foreach $letter


# Framework example #3
$letterArray = 1,2,3
foreach($letter in $letterArray){
    if($letter -eq 2){
        Write-Host "The number is 2" -ForegroundColor Yellow -BackgroundColor Black
        
        }
    Write-Host $letter -ForegroundColor Red -BackgroundColor Black
    Pause

    
    } #foreach $letter


# Framework example #4
$letterArray = Get-Disk
foreach($letter in $letterArray){
    if($letter -eq 2){
        Write-Host "The number is 2" -ForegroundColor Yellow -BackgroundColor Black
        
        } # If $letter
    Write-Host $letter -ForegroundColor Red -BackgroundColor Black
    Pause

    
    } #foreach $letter


$letterArray | Format-Table
$letterArray | Format-Table -Property *
$letterArray | Format-List
$letterArray | Format-List -Property *
$letterArray | Select-Object
$letterArray | Select-Object -Property *
$letterArray | Select-Object -Property * | Out-GridView




# Framework example #5
$letterArray = Get-Process
foreach($letter in $letterArray){
    if($letter -eq 2){
        Write-Host "The number is 2" -ForegroundColor Yellow -BackgroundColor Black
        
        } # If $letter
    Write-Host $letter -ForegroundColor Red -BackgroundColor Black
    Pause

    
    } #foreach $letter

