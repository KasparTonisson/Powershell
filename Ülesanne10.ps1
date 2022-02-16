#########################
#    Kaspar Tõnisson    #
#      10.02.2022       #
#         IT-21         #
#########################


#Tühjendame käsurea akna
cls

$xml = [xml](Get-Content C:\POWERSHELL\customers.xml)
$rows = $xml.customers.customer

foreach($row in $rows)
{
    if($row.country -eq 'Poland'){

        Write-Host('Nimi:',$row.full_name)
        Write-Host('Riik:',$row.country)
        Write-Host('Kontakt:',$row.contact)
        Write-Host('------------------')
        }
    }
