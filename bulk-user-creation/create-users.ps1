# Import Active Directory module
Import-Module ActiveDirectory

# Import employees from CSV file
$users = Import-Csv ".\employees.csv"

# Define domain
$domain = "DC=company,DC=local"

foreach ($user in $users) {

    $first = $user.FirstName
    $last = $user.LastName
    $dept = $user.Department
    $title = $user.JobTitle

    # Generate base username (first initial + last name)
    $sam = ($first.Substring(0,1) + $last).ToLower()

    $count = 1
    $originalSam = $sam

    # Check if username already exists
    while (Get-ADUser -Filter "SamAccountName -eq '$sam'" -ErrorAction SilentlyContinue) {
        $sam = "$originalSam$count"
        $count++
    }

    $ou = "OU=$dept,$domain"

    # Check if OU exists
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$dept'" -ErrorAction SilentlyContinue)) {

        Write-Host "Creating OU for $dept"

        New-ADOrganizationalUnit `
            -Name $dept `
            -Path $domain
    }

    # Create the user
    Write-Host "Creating user $first $last with username $sam"

    New-ADUser `
        -Name "$first $last" `
        -GivenName $first `
        -Surname $last `
        -SamAccountName $sam `
        -Title $title `
        -Department $dept `
        -AccountPassword (ConvertTo-SecureString "Password123!" -AsPlainText -Force) `
        -Enabled $true `
        -Path $ou
}
