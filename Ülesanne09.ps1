#############################
#        02.02.2022         #
#      Kaspar Tõnisson      #
#          IT-21            #
#############################

#Tühjendame käsurea
cls

#Tekitame massiivi CSV päise jaoks
$csv_header =@("name;username;email;password")

#Lisame päise CSV faili
$csv_header | Set-Content $dir\emails.csv

#Loeme sisse kasutajad
$users = Import-Csv $dir\users.csv

#Impordime andmed tsükkliga
$kasutajad = Import-Csv $dir\users.csv

foreach($kasutaja in $kasutajad){

    #Leiame nimed ja kasutajanimed
    $enimi = $kasutaja.first_name
    $pnimi = $kasutaja.last_name
    $kasutajanimi = $enimi[0]+$pnimi
    $lower = $kasutajanimi.tolower()
    $email = ($enimi+"."+$pnimi).ToLower() + "@hkhk.edu.ee"

    #Loome parooli
    $pass = 1..3 | ForEach-Object { Get-Random -Maximum $pnimi.Length }
    $pass = -join $pnimi[$pass] 
    $pass += Get-Random -Maximum 10
    $pass += Get-Random -Maximum 10

    #Lisan nime, kasutajanime, emaili ja parooli ühte veergu
    $row = $enimi + " " + $pnimi + ":" + $lower + ":" + $email + ":" + $pass
    Add-Content $dir\emails.csv $row

    }
  