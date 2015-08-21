<#*******************************************************
Alignment Check Powershell Script
by Warren Byle
warren_byle@dell.com
04/20/2011
use at your own risk, as is, no warranties
*******************************************************#>
$strComputer = "." 

$objServices = get-wmiobject -class "Win32_DiskPartition" -namespace "root\CIMV2" `
-computername $strComputer
$objServices | foreach {
$offset=($_.startingoffset / 4096)
If ([long] $offset -eq $offset)
    {write-host $_.DeviceID "is aligned"}
Else
    {write-host $_.DeviceID "is NOT aligned"}
}