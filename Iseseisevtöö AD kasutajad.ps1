#############################
#        03.02.2022         #
#      Kaspar Tõnisson      #
#          IT-21            #
#############################

cls

#Loeme sisse kasutajad
$users = Import-Csv C:\POWERSHELL\kasutajad.csv

#Teen tsükkli mis kontrollib kus OUs on kasutajad
#Juhul kui OUd pole, teeb ta uue

foreach($user in $users) {

    #Teen muutujad
    $nimi = $user.Eesnimi + " " + $user.Perekonnanimi
    $SAM = ($user.Eesnimi[0]+$user.Perekonnanimi).ToLower()
    $UPN = ($user.Eesnimi).ToLower() + "." + ($user.Perekonnanimi).ToLower()+"@tonisson.local"
    $parool = (ConvertTo-SecureString -AsPlainText "Par00lA" -Force)
    $OU = ($user.osakond).ToUpper()
    $parent = 'OU=KASUTAJAD,DC=tonisson,DC=local'
    $OUS = 'OU='+$OU+',OU=KASUTAJAD,DC=tonisson,DC=local'
   

    #Kui OU puudub, siis teeb selle
    if (Get-ADOrganizationalUnit -Filter "Name -eq '$OU'"){
        Write-Host "$OU already exists."
    } else {
        New-ADOrganizationalUnit -Name $OU -path $parent
    }

try{
    (Get-ADUser $SAM).sAMAccountName
    $olemas = $true
    $ER = Write-Host "$SAM, on juba olemas"


    Add-Content C:\POWERSHELL\KasutajadLog.txt $ER
}
#Teeb kasutajad kui neid pole
catch [Microsoft.ActiveDirectory.Management.ADIdentityResolutionException]{
New-ADUser -Name $nimi -GivenName $user.Eesnimi -Surname $user.Perekonnanimi -SamAccountName $SAM -UserPrincipalName $UPN -AccountPassword $parool -DisplayName $nimi -ChangePasswordAtLogon $true -Path $OUS -Enabled $true

}

#Vaatab kas kasutaja on juba olemas ja kui on, siis ütleb millal lisati


$aeg = Get-ADUser $SAM -Properties whenCreated | Select whenCreated | Format-Table -HideTableHeaders
$aeg1 = Out-String -InputObject $aeg
$aeg2 = "Kasutaja $SAM lisati $aeg1"
Add-Content C:\POWERSHELL\KasutajadLog.txt $aeg2
}











