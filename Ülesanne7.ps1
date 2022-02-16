##########################
#        ÜLESANNE 7      #
#        24.01.2022      #
#      Kaspar Tõnisson   #
##########################

#Puhastame käsurea akna
cls

 #Domeenis olevad seadmed

 $arvutid = Get-ADComputer -filter {operatingsystem -like '*windows*'} -property * | Select-Object Name | select -ExpandProperty Name
 
 #Leiab kettad domeenist

 foreach($arvuti in $arvutid){
    Write-Host "$arvuti"
    #Leiab kettad
    $domeenikettad = (Get-WmiObject -ComputerName $arvuti -Class win32_Logicaldisk).deviceid.substring(0,1)
    #
    foreach($domeeniketas in $domeenikettad){

        Write-Host "Võrguketas: $domeeniketas"
        #Leiab domeeniketta suurused ja protsendi
        $kettavabaruum = (Get-WmiObject -ComputerName $arvuti -Class win32_logicaldisk | Where-Object {$_.deviceid -like "*$domeeniketas*"}).freespace

        $kettaruum = (Get-WmiObject -ComputerName $arvuti -Class win32_logicaldisk | Where-Object {$_.deviceid -like "*$domeeniketas*"}).size

        $kettaprotsent = [math]::Round(($kettavabaruum/$kettaruum*100),2)

        Write-Host "Kettamaht $kettaprotsent %"
        #
        if($kettaprotsent -lt 50) {
            Write-Host "Kuuled v ketas hakkab täis saama, vabaruumi on $kettaprotsent %"
            "--------------------------------------------------------"
        }
    else {
    Write-Host "Kuuled v vabaruumi on $kettaprotsent % kasuta vaba ruumi"
    "--------------------------------------------------------"
    }
    }
    }
   
      