
# autor: Markus Pilv
# kuupäev Detsember 13, 2022

#küsib csv faili
$fileName = Read-Host "sööda mulle csv fail"

#vaatab kas on csv fail
if ($fileName -notmatch ".csv$") 
{
  Write-Host "fail pole csv fail"
  #STOP, FAIL POLE CSV
  return

}
else
{
#csv fail on nyyd $names sees
$names = Import-Csv -Path $fileName

#domeen küs
$domain = Read-Host "sööda domeen pleas"

#output txt fail
$outputFile = "emails.txt"

#loop
foreach ($name in $names) {
  #väiksed tähed
  $firstName = $name.FirstName.ToLower()
  $lastName = $name.LastName.ToLower()

  #tee email adress
  $email = "$firstName.$lastName@$domain"

  #salvesta faili
  Add-Content -Path $outputFile -Value $email
}
}