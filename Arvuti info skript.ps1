cls

#################################
$protsessor = (Get-WmiObject Win32_Processor).name
#################################
$ip = (Get-NetIPAddress -AddressFamily IPV4).IPAddress
#################################
$os = (Get-CimInstance -ClassName CIM_OperatingSystem).Caption
#################################
$net = (Get-NetAdapter).Name
#################################
$host1 = (Get-WmiObject Win32_Computersystem).name
#################################
$ram = (Get-WmiObject Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1gb
#################################
$gpu = (Get-WmiObject win32_VideoController).name
#################################
$kasutaja = $env:UserName
#################################
Write-Host "RAM'i maht on" $ram "GB"
"**************************"
Write-Host "GPU on" $gpu
"**************************"
Write-Host "Kasutaja on" $kasutaja
"**************************"
Write-Host "Protsessor on" $protsessor
"**************************"
Write-Host "IP aadress on" $ip
"**************************"
Write-Host "Operatsioonisüsteem on" $os
"**************************"
Write-Host "Neti adapter on" $net
"**************************"
Write-Host "Arvuti nimi on" $host1
"**************************"
