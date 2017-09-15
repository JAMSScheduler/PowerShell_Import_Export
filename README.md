# PowerShell_Import_Export
This repository contains two PowerShell scripts for an easier way of handling import/export of jobs from a folder level in JAMS version 6.x

Included are two powershell scripts.  By default our Export-JAMSXml cmdlet will only export one job or folder at a time.  

The Export PowerShell script was built to be able to export all jobs within a given folder in a two step process. First it exports all of the job names and then the full job definitions. 

The Import PowerShell script allows the user to import the xml file with just the job names so the job definitions are created first to avoid any dependency issues and then the user would import the full job definitions from the second export file. 

If a user tries to import jobs that have dependencies attached to them and those dependencies are not imported first, the import will fail.  This ensures that a "shell" of all of the jobs are imported first that way dependencies are covered.  

**Be sure to update the following before trying to run these scripts.**
ExportScript.ps1
1) $targetFolder needs changed to the JAMS directory that you are exporting the jobs from.
2) $firstExportPath needs changed to the local path where you would like to save your first .xml file containing just the job names.
3) $secondExportPath needs changed to the local path where you would like to save your second .xml file containing the full job definitions. 

ImportScript.ps1
1)In the first Import-JAMSXml cmdlet: 
    a) -Path should point to the $firstExportPath from above steps.
    b) -TargetFolder should be updated to the folder in JAMS you would like to import the jobs to. 
    c) -Server should be updated to the name of the server you are importing the jobs to.
    
2) In the second Import-JAMSXml cmdlet: 
    a) -Path should point to the $secondExportPath from above steps.
    b) -TargetFolder should be updated to the folder in JAMS you would like to import the jobs to. 
    c) -Server should be updated to the name of the server you are importing the jobs to.
    
