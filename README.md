<div>
    <a href="https://github.com/sponsors/enriquecatala"><img src="https://img.shields.io/badge/GitHub_Sponsors--_.svg?style=flat-square&logo=github&logoColor=EA4AAA" alt="GitHub Sponsors"></a>
    <a href="https://enriquecatala.com"><img src="https://img.shields.io/website?down_color=red&down_message=down&label=enriquecatala.com&up_color=46C018&url=https%3A%2F%2Fenriquecatala.com&style=flat-square" alt="Data Engineering with Enrique Catalá"></a>
    <a href="https://www.linkedin.com/in/enriquecatala"><img src="https://img.shields.io/badge/LinkedIn--_.svg?style=flat-square&logo=linkedin" alt="LinkedIn Enrique Catalá Bañuls"></a>
    <a href="https://twitter.com/enriquecatala"><img src="https://img.shields.io/twitter/follow/enriquecatala?color=blue&label=twitter&style=flat-square" alt="Twitter @enriquecatala"></a>
    <a href="https://youtube.com/enriquecatala"><img src="https://raw.githubusercontent.com/enriquecatala/enriquecatala/master/img/youtube.png" alt="Data Engineering: Canal youtube de Enrique Catalá" height=20></a>
</div>

<a href="https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala"><img src="https://raw.githubusercontent.com/enriquecatala/enriquecatala/master/img/MVP_Logo_horizontal.png" alt="Microsoft DataPlatform MVP Enrique Catalá"></a>
# azure-arm-dataplatform-vm-template

This includes the Windows VM that I usually deploy in Azure. It is ready to work for dev/data projects, because it includes most of the [common software](#software-deployed) from the DevOps perspective

The average deployment type is: 20 minutes
- After 2 minutes, you will be able to connect and start working if you want (the software will be installed in the background)
- After 20 minutes, the VM will be rebooted and everything will be prepared



> NOTE: Please have in mind that the deployment process includes installing [software](#software-deployed)

## How to deploy

### Create resource group (optional)
Create the resource group with the _SubscriptionName_ and _ResourceGroupLocation_ you need:

```powershell
#Connect to your azure account
Connect-AzAccount
# Create your resource group (optional)
.\create-resource-group.ps1 -SubscriptionName "Patrocinio de Microsoft Azure" -ResourceGroupLocation "North Europe"
```
> IMPORTANT: Please remember to update your [rg-management.parameters.json](rg-management/rg-management.parameters.json)

### Deploy virtual machine

To deploy the virtual machine, you can use the following command
```powershell
.\deploy-vm.ps1 -ResourceGroupName "rg-management"
```

>IMPORTANT: Update params in the [vm-deploy.paramters.json](rg-management/vm-deploy.parameters.json)

## Software deployed

The software pre-deployed is installed with chocolatey with the [_installsoftware.ps1_ script](CustomScripts/installsoftware.ps1) 

- Google Chrome
- git
- Visual Studio Code
- Azure Data Studio
- Azure storage explorer
- SQL Server Management Studio

