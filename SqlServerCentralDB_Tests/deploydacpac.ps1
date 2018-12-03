param (
    [string]$SqlInstance = "localhost", 
    [string]$Database = "SqlServerCentral_Dev"
)

install-module dbatools

# getting the path to the parent directory OF this script
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# getting the dacpac and publish profile
$dacpac = "$scriptDir\SqlServerCentral.dacpac"
$profile = "$scriptDir\dev.publish.xml"

# deploying the dacpac
Publish-DbaDacPackage -Database $Database -SqlInstance $SqlInstance -Path $dacpac # -PublishXml $profile