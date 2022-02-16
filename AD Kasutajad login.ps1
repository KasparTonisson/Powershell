cls
$OU = "OU=KASUTAJAD,DC=TONISSON,DC=LOCAL"
$ADKasutajad = Get-ADUser -Filter * -SearchBase $OU -Properties distinguishedname, LastLogon | Select distinguishedname, samaccountname, @{Name='LastLogon';Expression={[DateTime]::FromFileTime($_.LastLogon)}}

foreach($kasutaja in $ADKasutajad){
    $knimi = $kasutaja.samaccountname
    $login = $kasutaja.LastLogon
    $path = $kasutaja.distinguishedname
    $kuupaev = Get-Date
    $vahe = (New-TimeSpan -Start $login -End $kuupaev).Days
    
    if ($vahe -gt 365){
        Write-Host("Kasutaja $ADKasutajad logis sisse rohkem kui aasta aega tagasi.")
        Move-ADObject -Identity $path -TargetPath "OU=ENDISEDTOOTAJAD,DC=TONISSON,DC=LOCAL"
        Disable-ADAccount -Identity $knimi
    }
        else
    {
        Write-Host("Kasutaja $knimi autentis ennast viimati $vahe päeva tagasi")
    }
    }