<# 
    Author:  Enrique Catalá Bañuls
             enrique@enriquecatala.com
    Profile: https://www.linkedin.com/in/enriquecatala
    Twitter: @enriquecatala
    
    .DESCRIPTION
    This powershell is ready to create a resource group with the corresponding ARM template
    NOTE: Please ensure you are connected to Azure by executing
          Connect-AzAccount


    .PARAMETER SubscriptionName
    Name of the Azure subscription where the resource group is going to be created
    
    .PARAMETER ResourceGroupLocation
    Resource location

    .PARAMETER TemplateFile
    Azure ARM deployment template file (json)

    .PARAMETER TemplateParametersFile
    Azure ARM deployment template parameter´s file (json)
    
    .DESCRIPTION
    This powershell deploys the Azure Resources using the ARM template

#>      

#Get-AzSubscription

Param(
    [string] [Parameter(Mandatory=$true)] $SubscriptionName = "Patrocinio de Microsoft Azure",
    [string] [Parameter(Mandatory=$true)] $ResourceGroupLocation = "North Europe",
    [string] $TemplateFile = ".\rg-management\rg-management.json",
    [string] $TemplateParametersFile = ".\rg-management\rg-management.parameters.json"    

)

Set-AzContext -SubscriptionName $subscriptionName


# Creamos el resource group 
New-AzDeployment -Name ((Get-ChildItem $TemplateFile).BaseName + '-' + ((Get-Date).ToUniversalTime()).ToString('MMdd-HHmm'))  `
                 -Location $ResourceGroupLocation `
                 -TemplateFile $TemplateFile `
                 -TemplateParameterFile $TemplateParametersFile