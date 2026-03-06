# - Bulk User Creation via Powershell

## What is this ?
- 'employees.csv': 20 Fictional employees
- 'create-users.ps1': script that reads the CSV file and creates OUs by Department and creates users. 

## Note 
The Active Directory commands require a Windows Server domain. This repo includes the script and CSV for review/PR.

## Requirements
- Windows Server with Active Directory Doman Services installed
- PowerShell with the Active Directory module
- Administrator Privileges
- A CSV file containing employee data

## CSV Format
The employees.csv file must contain the following columns:
FirstName, LastName, Department, JobTitle

## How the script works
1. Imports the Active Directory module
2. Reads user data from the CSV file
3. Generates a username using first initial & last name
4. Checks if the username already exists
5. Creates a department Organizational Unit if it does not exist 
6. Creates the user account in Active Directory
7. Assigns department and job title attributes
8. Enables the user account

## How to Run 
1. Open Powershell as Administrator
2. Navigate to the project directory
3. Run the script
