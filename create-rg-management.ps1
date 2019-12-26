#Connect-AzAccount
#Get-AzSubscription

Param(
    [string] [Parameter(Mandatory=$true)] $subscriptionName = "Patrocinio de Microsoft Azure",
    [string] [Parameter(Mandatory=$true)] $ResourceGroupLocation = "North Europe",
    [string] $ResourceGroupName = 'rg-management',   
    [string] $TemplateFile = ".\rg-management\rg-management.json",
    [string] $TemplateParametersFile = ".\rg-management\rg-management.parameters.json"    

)

Set-AzContext -SubscriptionName $subscriptionName


# Creamos el resource group 
New-AzDeployment -Name $ResourceGroupName `
                 -Location $ResourceGroupLocation `
                 -TemplateFile $TemplateFile `
                 -TemplateParameterFile $TemplateParametersFile
