#######################
#      HKHK IT-21
#    Kaspar Tõnisson
#    13.jaanuar 2022
#######################

#puhastame kõigepealt käsureaakna
cls

Write-Host
Write-host "Õpime kirjutama scripti PowerShellis"

$kuupaev = Get-Date -Format 'dd,MM,yyyy'
Write-Host "Tänane kuupäev on $kuupaev!"

Write-Host "Aasta lõpuni on jäänud" (New-TimeSpan 2022-12-31).Days "päeva `n"

