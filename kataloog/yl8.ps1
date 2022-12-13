function ringi_pindala
{
    <#
    .SYNOPSIS
        Arvutab
    .DESCRIPTION
        Arvutab ringi pindala 
    .EXAMPLE
        Paned raadiuse ja arvutab selle valmis
    .EXAMPLE
        Ei
    #>
    param($raadius)

    $s=[Math]::PI+[Math]::POW($raadius,2)
    [Math]::Round($s,2)


}

ringi_pindala(4)

"**************************************"

function nimede_puhastamine
{
    param($nimi)
    $nimi = $nimi.Trim()
    $nimi = $nimi.replace("õ","o").replace("ä","a").replace("ö","o").replace("ü","u")
    (Get-Culture).TextInfo.ToTitleCase($nimi.ToLower())





}

nimede_puhastamine("       õäöü      ")


