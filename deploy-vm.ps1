<# 
    Author:  Enrique Catalá Bañuls
             enrique@enriquecatala.com
    Profile: https://www.linkedin.com/in/enriquecatala
    Twitter: @enriquecatala
    
    .PARAMETER ResourceGroupName
    Azure Resource group where the virtual machine will be deployed
    NOTE: It must exist

    .PARAMETER TemplateFile
    Azure ARM deployment template file (json)

    .PARAMETER TemplateParametersFile
    Azure ARM deployment template parameter´s file (json)

    .PARAMETER ValidateOnly
    Switch to indicate if we only want to validate the template

    .DESCRIPTION
    This powershell deploys the Virtual Machine by using the ARM template
#>      

#Requires -Version 3.0

Param(
    [string] [Parameter(Mandatory=$true)] $ResourceGroupName = 'rg-management',   
    [string] $TemplateFile = ".\rg-management\vm-deploy.json",
    [string] $TemplateParametersFile = ".\rg-management\vm-deploy.parameters.json",
    [switch] $ValidateOnly
)


$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 3

function Format-ValidationOutput {
    param ($ValidationOutput, [int] $Depth = 0)
    Set-StrictMode -Off
    return @($ValidationOutput | Where-Object { $_ -ne $null } | ForEach-Object { @('  ' * $Depth + ': ' + $_.Message) + @(Format-ValidationOutput @($_.Details) ($Depth + 1)) })
}


if ($ValidateOnly) {
    $ErrorMessages = Format-ValidationOutput (Test-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName `
                                                                                  -TemplateFile $TemplateFile `
                                                                                  -TemplateParameterFile $TemplateParametersFile )
    if ($ErrorMessages) {
        Write-Output '', 'Validation returned the following errors:', @($ErrorMessages), '', 'Template is invalid.'
    }
    else {
        Write-Output '', 'Template is valid.'
    }
}
else {
    New-AzureRmResourceGroupDeployment -Name ((Get-ChildItem $TemplateFile).BaseName + '-' + ((Get-Date).ToUniversalTime()).ToString('MMdd-HHmm')) `
                                       -ResourceGroupName $ResourceGroupName `
                                       -TemplateFile $TemplateFile `
                                       -TemplateParameterFile $TemplateParametersFile `
                                       -Force -Verbose `
                                       -ErrorVariable ErrorMessages
    if ($ErrorMessages) {
        Write-Output '', 'Template deployment returned the following errors:', @(@($ErrorMessages) | ForEach-Object { $_.Exception.Message.TrimEnd("`r`n") })
    }
}