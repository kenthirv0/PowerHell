$xml = [xml](Get-Content c:\autod.xml)
$rows = $xml.autod.auto
foreach ($row in $rows)
{
    if($row.aasta -gt 2000){
        $row.automark
    }
}