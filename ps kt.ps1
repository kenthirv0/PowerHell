#K.Hirv
#14.12.22
#yl 3

# Get the file path from the user
$file = Read-Host "Enter the path of the CSV file"

# Import the CSV file
$data = Import-Csv $file

# Use a regular expression to match email addresses
$pattern = "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b"

# Loop through each row of the CSV file
foreach ($row in $data) {
    # Loop through each column of the current row
    foreach($column in $row.PSObject.Properties) {
        # Check if the current column contains an email address
        if ($column.Value -match $pattern) {
            # Extract the username from the email address
            $username = $column.Value.Split("@")[0]

            # Generate a random password
            $password = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})

            # Add the username and password to the current row
            $row | Add-Member -MemberType NoteProperty -Name "Username" -Value $username
            $row | Add-Member -MemberType NoteProperty -Name "Password" -Value $password
        }
    }
}

# Save the file
$data | Export-Csv $file -NoTypeInformation
