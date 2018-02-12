$deployPath =  $PSScriptRoot
Write-Host -ForegroundColor Black -BackgroundColor Yellow "Running from package location: $deployPath"

# Your subscription ID that you wish to deploy this template to
$subscriptionId="aaa-bbb-ccc-ddd"
$resourceGroupName="GurbindarWebAppUAT"
$resourceGroupLocation="canadacentral"

# subscription environment preparation

# list of packages to iterate through
$packageList="GurbWebApp-Network","GurbWebApp-Server"
# deploy default network
foreach($taskFolder in $packageList) {
    Write-Host -ForegroundColor Green "Deploying Package $taskFolder"
    $command = "$deployPath\$taskFolder\deploy.ps1 -subscriptionId $subscriptionId -resourceGroupName $resourceGroupName -resourceGroupLocation $resourceGroupLocation -deploymentName $taskFolder -templateFilePath $deployPath\$taskFolder\template.json -parametersFilePath $deployPath\$taskFolder\parameters.json"
    write-host $command
    Invoke-Expression -Command $command
}