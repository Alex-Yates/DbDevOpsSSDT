# PowerShell to deploy a Dacpac from Azure DevOps - requires sqlpackage.exe to be installed and added to PATH

$args = @("-SourceFile:$env:dacpac",
    "-Action:Publish",
    "-Profile:$env:profile"
)

Write-Host "Executing: & sqlpackage $args"
& sqlpackage $args

# Requires the following env variables to be set
# dacpac | $(System.DefaultWorkingDirectory)/_SqlServerCentral-.NET Desktop-CI/drop/SqlServerCentralDB/SqlServerCentral/bin/Release/SqlServerCentral.dacpac
# profile | $(System.DefaultWorkingDirectory)/_SqlServerCentral-.NET Desktop-CI/drop/SqlServerCentralDB/SqlServerCentral/bin/Release/int.publish.xml
