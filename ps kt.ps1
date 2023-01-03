#K.Hirv
#14.12.22
#yl 3

# valib csv faili
$file = Read-Host "Enter the path of the CSV file"

# impordib csv faili
$data = Import-Csv $file

# kasutab eposti aadresside sobitamiseks ühesugust formaati
$pattern = "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b"

# loeb CSV-faili iga rida
foreach ($row in $data) {
    # kerib läbi praeguse rea iga veeru
    foreach($column in $row.PSObject.Properties) {
        # kontrollib kas praeguses veerus on e-posti aadress
        if ($column.Value -match $pattern) {
            # võtab e-posti aadressist kasutajanime
            $username = $column.Value.Split("@")[0]

            # loob suvalise parooli
            $password = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})

            # lisab kasutajanime ja parooli praegusesse ritta
            $row | Add-Member -MemberType NoteProperty -Name "Username" -Value $username
            $row | Add-Member -MemberType NoteProperty -Name "Password" -Value $password
        }
    }
}

# salvestab vaili
$data | Export-Csv $file -NoTypeInformation
