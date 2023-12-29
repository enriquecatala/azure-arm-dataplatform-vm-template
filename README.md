<div class="social_links">
    <a href="https://www.clouddataninjas.com"><img src="https://img.shields.io/website?down_color=red&down_message=down&label=clouddataninjas.com&up_color=46C018&url=https%3A%2F%2Fwww.clouddataninjas.com&style=for-the-badge" alt="Cloud Data Ninjas"></a>
    <a href="https://github.com/enriquecatala" target="_blank"><img  src="https://img.shields.io/github/followers/enriquecatala?label=GitHub&style=for-the-badge" alt="GitHub followers of Enrique Catalá" ></a>
    <a href="https://github.com/sponsors/enriquecatala" target="_blank"><img src="https://img.shields.io/badge/GitHub_Sponsors--_.svg?style=for-the-badge&logo=github&logoColor=EA4AAA" alt="Sponsor Enrique Catalá on GitHub" ></a>    
    <a href="https://www.linkedin.com/in/enriquecatala" target="_blank"><img src="https://img.shields.io/badge/LinkedIn--_.svg?style=for-the-badge&logo=linkedin" alt="LinkedIn Enrique Catalá" ></a>        
    <a href="https://twitter.com/enriquecatala" target="_blank"><img src="https://img.shields.io/twitter/follow/enriquecatala?color=blue&label=twitter&style=for-the-badge" alt="Twitter @enriquecatala" ></a>    
    <a href="https://enriquecatala.com"><img src="https://img.shields.io/website?down_color=red&down_message=down&label=enriquecatala.com&up_color=46C018&url=https%3A%2F%2Fenriquecatala.com&style=for-the-badge" alt="Data Engineering with Enrique Catalá"></a>
    <a href="https://youtube.com/enriquecatala"><img src="https://raw.githubusercontent.com/enriquecatala/enriquecatala/master/img/youtube.png" alt="Canal de Enrique Catalá" height=20></a>
</div> 

<div style="display: flex; align-items: center; justify-content: center;">
  <a href="https://www.credly.com/badges/cde0dbd2-8d03-4ca7-8284-d471d65d0e5f">
      <img src="https://raw.githubusercontent.com/enriquecatala/enriquecatala/master/img/MVP_Logo_horizontal.png" 
           alt="Microsoft DataPlatform and AI MVP Enrique Catalá"
           style="min-height: 50px; max-height: 70px; min-width: 100px">
  </a>
  <a href="https://www.clouddataninjas.com">
          <img src="https://raw.githubusercontent.com/enriquecatala/enriquecatala.github.io/master/img/CLOUDDATANINJAS.png" 
          alt="Cloud Data Ninjas" 
          style="min-height: 50px; max-height: 70px; min-width: 250px "/>
  </a>
</div>

# azure-arm-dataplatform-vm-template

This includes the Windows VM that I usually deploy in Azure. It is ready to work for dev/data projects, because it includes most of the [common software](#software-deployed) from the DevOps perspective

The average deployment type is: 20 minutes
- After 2 minutes, you will be able to connect and start working if you want (the software will be installed in the background)
- After 20 minutes, the VM will be rebooted and everything will be prepared



> NOTE: Please have in mind that the deployment process includes installing [software](#software-deployed)

## How to deploy

### Prerequisites

```powershell
if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name AzureRM -ListAvailable)) {
    Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' +
      'Az modules installed at the same time is not supported.')
} else {
    Install-Module -Name Az -AllowClobber -Scope CurrentUser
    Enable-AzureRmAlias -Scope CurrentUser
}


```

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

