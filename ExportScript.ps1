#
# The Folder to export from
#
$targetFolder = "Samples\TestFolder"

#
# Add the JAMS module
#
Import-Module JAMS

#
# Set the path of the first export which will just export job names and empty properties
#
$firstExportPath = "C:\Users\TimF.MVP\Desktop\SUPPORT\FirstExport.xml"

#
# Get Jobs in the specified Folder recursively
#
$jobList = Get-ChildItem JAMS::localhost\$targetFolder\* #-Recurse

"<?xml version=""1.0"" encoding=""utf-8""?>" | Out-File $firstExportPath -Append utf8

"<Jobs xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns=""http://jams.mvpsi.com/v1"">" | Out-File $firstExportPath -Append utf8

foreach($obj in $jobList)
{
       if ($obj -is [MVPSI.JAMS.Job])
       {
              "<Job name=""{0}"">" -f $obj.JobName | Out-File $firstExportPath -Append utf8
              "</Job>" | Out-File $firstExportPath -Append utf8
       }
}
"</Jobs>" | Out-File $firstExportPath -Append utf8
$secondExportPath = "C:\Users\TimF.MVP\Desktop\SUPPORT\SecondExport.xml"

Export-JAMSXml -InputObject $jobList -Path $secondExportPath