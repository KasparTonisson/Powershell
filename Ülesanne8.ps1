###############################
#          27.01.2022         #
#        Kaspar Tõnisson      #
#            IT-21            #
###############################

#Kustutame käsurea akna
cls

#Teeme funktsiooni ringipindala arvutamiseks

function raadius{
  <#
  .SYNOPSIS
  Kirjuta mis on sinu ringi raadius
  .DESCRIPTION
  Kirjuta oma ringi raadius cm, mille pindala sa tahad
  .EXAMPLE
  Kirjutad näieks 2cm ja saad vastuse Ringi pindala on 12.57
  #>
    param
        (
        [Parameter(Mandatory=$true, HelpMessage=’Lisa ringi raadius’)]
        $raadius
        )
        $s = [Math]::Round([Math]::PI*[Math]::Pow($raadius,2),2)
        
    "Ringi pindala on $s"

}
    
ytle-tere

#Teeme funktsiooni täpitähtede kustutamiseks
function nimi{
<#
  .SYNOPSIS
  Kirjuta mis on sinu nimi
  .DESCRIPTION
  Kirjuta oma nimi täpitähtedega
  .EXAMPLE
  Kirjutad näieks Jüri ja ta muudab selle Juri-ks
 
  #>
    param
        (
        [Parameter(Mandatory=$true, HelpMessage='Lisa oma täisnimi')]
        $nimi
        )
        $nimed = $nimi -replace "\s+"," "
        $asenda = $nimed.Replace("ü","u").Replace("ä","a").Replace("õ","o").Replace("ä","a")
        (Get-Culture).TextInfo.ToTitleCase($asenda.ToLower())
}
nimi
