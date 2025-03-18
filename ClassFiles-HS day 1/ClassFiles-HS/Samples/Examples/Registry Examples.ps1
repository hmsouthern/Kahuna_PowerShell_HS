# Query the Registry
clear
#WARNING:  WORKING IN THE REGISTRY IS LIKE 'BRAIN SURGERY'.  ONLY 'DO' ANYTHING IN THE REGISTRY IN A TEST LAB RELATED TO WHAT WE ARE DOING IN THIS COURSE

# TO DO:  (NOTE:  'yourname' would have your name in it (i.e., yourname)
    #PRE-CREATE 'Manually' THE FOLLOWING UNDER 'HKCU\SOFTWARE\:
    # 1.  KEY: 10961
    # 2.  DWORD=347 (UNDER 'HKCU\SOFTWARE\10961')
    # 3.  STRING=YOURNAME ('HKCU\SOFTWARE\10961')


Get-ChildItem -Path 'HKCU:\SOFTWARE\10961' #LISTS 'ITEMS' (KEYS) DIRECT UNDER KEY 10961, NOT 'PROPERTIES' (SUCH AS DWORD, STRING, ETC...)
Get-ChildItem -Path 'HKCU:\SOFTWARE\10961' -Recurse #LISTS 'ITEMS' (KEYS) DIRECT UNDER KEY 10961 AND SUB KEYS, NOT 'PROPERTIES' (SUCH AS DWORD, STRING, ETC...)
Get-ItemProperty -Path 'HKCU:\SOFTWARE\10961'  #LISTS 'PROPERTY OF THE KEY '10961'
Get-Item -Path 'HKCU:\SOFTWARE\10961' #LISTS 'PROPERTIES'(DWORD, STRING, ETC...) DIRECTLY UNDER KEY 10961
Get-Item -Path 'HKCU:\SOFTWARE\10961' #LISTS 'PROPERTIES'(DWORD, STRING, ETC...) DIRECTLY UNDER KEY 10961
Get-Item -Path 'HKCU:\SOFTWARE\10961' -Include * #LISTS 'PROPERTIES'(DWORD, STRING, ETC...) DIRECTLY UNDER KEY 10961

#TEST A QUERY AGAINST A 'REAL-WORLD' AREA
Get-Item -Path 'HkCu:\Software\Microsoft\Internet Explorer'
Get-Item -Path 'HKCU:\software\microsoft\internet explorer\*'
Get-ChildItem -Path 'HKcu:\Software\Microsoft\Internet Explorer'

# Create new items/properties under 10961
New-Item -Path 'HKCU:\SOFTWARE\10961'
New-Item -Path 'HKCU:\SOFTWARE\10961' -Name yourname # creates a STRING Item
New-Item -Path 'HKCU:\SOFTWARE\10961' -Name yourname1 -Value 347 -WhatIf # creates a DWORD Item
New-Item -Path 'HKCU:\SOFTWARE\10961' -Name yourname2 -ItemType dword -WhatIf
New-Item -Path 'HKCU:\SOFTWARE\10961' -Name yourname3 -ItemType dword -WhatIf
New-Item -Path 'HKCU:\SOFTWARE\10961' -Name yourname4 -ItemType qword -Value 544 -WhatIf
New-Item -Path 'HKCU:\SOFTWARE\10961' -Name yourname3 -ItemType dword -Value 347 -WhatIf

Test-Path -Path HKLM:\SOFTWARE\yourname\ -PathType Leaf
Get-ItemProperty -Path HKLM:\SOFTWARE\yourname\ -Name ProcSelect 

if($TPath_yourname -eq $false)
    {write-host "Yourname does not exist"
    New-Item -Path 'HKLM:\SOFTWARE\yourname' -Force
    }



# LAB TASK (NOTE:  'yourname' would have your name in it (i.e., yourname)
    # 1. (Take up to 30 minutes to complete) Using Powershell, change the value of DWORD 'yourname' to 1000 in the 'HKCU:\SOFTWARE\10961' Key.
    # 2. (Take up to 30 minutes to complete) Using Powershell, if the value of DWORD 'yourname' is 347 then change it to 1000. 



# Task 1 examples (from previous students)
    #Tom:  
    Set-ItemProperty -Path 'hkcu:\software\10961' -Name yourname -Value 1000

    #Scott
    $RegPath = 'HKCU:\SOFTWARE\10961'
    Set-ItemProperty -Path $RegPath -Name 'yourname' -Value 999

    #Michael
    $RegPath = 'HKCU:\SOFTWARE\10961'
    $RegEntryName = 'yourname'
    $RegEntryValueLookup = 347 # to be used for Task 2
    $Regentryvalue = 1000
    Set-ItemProperty -path $RegPath -Name $RegEntryName -Value $Regentryvalue

    #Dennis
    $Name=yourname
    $newValue='1000'
    $path1='HKCU:\SOFTWARE\10961'
    Set-ItemProperty -Path $path -Name $Name -Value $newValue;Get-ItemProperty -Path $Path -Name yourname #NOTE:  (2) commands listed:  1 changes value, 2 queries the change
    Get-ChildItem $path1
    Get-ChildItem 'HKCU:\SOFTWARE'




New-Item -Path 'HKCU:\SOFTWARE\yourname' -Force 

New-ItemProperty -Path hkcu:\Software\Microsoft\Office\16.0\PowerPoint\options -Name UseMonMgr -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path HKCU:\SOFTWARE\yourname -Name UseMonMgr -Value 0 -PropertyType DWORD -Force

Set-ItemProperty -Path HKCU:\SOFTWARE\yourname -Name UseMonMgr -Value 1340 -WhatIf

$TPath_yourname = Test-Path -Path HKLM:\SOFTWARE\yourname -PathType Container
$TPath_yourname_ProcSelect = Test-Path -Path HKLM:\SOFTWARE\yourname\rocSelect\ -PathType Leaf
$TPath_yourname_ProcAll

Test-Path -Path HKLM:\SOFTWARE\yourname\ -PathType Leaf
Get-ItemProperty -Path HKLM:\SOFTWARE\yourname\ -Name ProcSelect 

if($TPath_yourname -eq $false)
    {write-host "yourname does not exist"
    New-Item -Path 'HKLM:\SOFTWARE\yourname' -Force
    }
 

if(){}
New-ItemProperty -Path HKLM:\SOFTWARE\yourname -Name ProcSelect -Value 1 -PropertyType DWORD -Force

if(){}
New-ItemProperty -Path HKLM:\SOFTWARE\yourname -Name ProcAll -Value 1 -PropertyType DWORD -Force

