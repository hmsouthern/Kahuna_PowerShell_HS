Test-NetConnection -ComputerName lon-svr1

Test-NetConnection -ComputerName lon-svr1 -CommonTCPPort WINRM


help pssession
help about_pssessions 

$RemoteSvrs = Get-ADComputer -Filter



New-PSSession -ComputerName $RemoteSvrs -Name GetProc
Get-PSSession

#Everything you want done on the remote computer must be in the curly brackets
Invoke-Command -ComputerName $RemoteSvrs -ScriptBlock {Get-Process}

Invoke-Command -ComputerName $RemoteSvrs -ScriptBlock {
Get-Item c:\
}