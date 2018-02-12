# UDPATE THESE VARIABLES BEFORE RUNNING
# Path that contains the deployment scripts
set deploy-path=C:\Users\Jason\Desktop\ManulifeDemo
# Your subscription ID that you wish to deploy this template to
set subscriptionId=aaaa-bbbb-cccc-ddddd


set resourceGroupName=GurbindarWebAppUAT
set resourceGroupLocation=canadacentral

# subscription environment preparation
# deploy default network
set taskFolder=GurbWebApp-Network
powershell.exe -ExecutionPolicy Bypass -File %deploy-path%/%taskFolder%/deploy.ps1 -subscriptionId %subscriptionId% -resourceGroupName %resourceGroupName% -resourceGroupLocation %resourceGroupLocation% -deploymentName %taskFolder% -templateFilePath %deploy-path%/%taskFolder%/template.json -parametersFilePath %deploy-path%/%taskFolder%/parameters.json

# deploy web server
set taskFolder=GurbWebApp-Server
powershell.exe -ExecutionPolicy Bypass -File %deploy-path%/%taskFolder%/deploy.ps1 -subscriptionId %subscriptionId% -resourceGroupName %resourceGroupName% -resourceGroupLocation %resourceGroupLocation% -deploymentName %taskFolder% -templateFilePath %deploy-path%/%taskFolder%/template.json -parametersFilePath %deploy-path%/%taskFolder%/parameters.json