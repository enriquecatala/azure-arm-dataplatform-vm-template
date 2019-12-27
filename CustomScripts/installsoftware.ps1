<# 
    Author:  Enrique Catalá Bañuls
             enrique@enriquecatala.com
    Profile: https://www.linkedin.com/in/enriquecatala
    Twitter: @enriquecatala
    
    .DESCRIPTION
    This powershell install very common software for data DevOps. You can use this script from a CustomScriptExtension resource in Azure ARM templates
#>         

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'git',`
            'visualstudiocode',`
            'azure-data-studio',`
            'microsoftazurestorageexplorer', `
            'sql-server-management-studio'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Install Visual Studio Code Extensions
$Extensions = 'ms-python.python',`
              'peterjausovec.vscode-docker', `
              'eamodio.gitlens', `
              'felipecaputo.git-project-manager', `
              'humao.rest-client', `
              'ms-azure-devops.azure-pipelines', `
              'ms-azuretools.vscode-apimanagement', `
              'ms-azuretools.vscode-azureappservice', `
              'ms-azuretools.vscode-azurefunctions', `
              'ms-azuretools.vscode-azurestorage', `
              'ms-azuretools.vscode-cosmosdb', `
              'ms-azuretools.vscode-docker', `
              'ms-kubernetes-tools.vscode-kubernetes-tools', `
              'ms-mssql.mssql', `
              'ms-vscode-remote.remote-wsl', `
              'ms-vscode.azure-account', `
              'ms-vscode.azurecli', `
              'ms-vscode.powershell', `
              'ms-vscode.vscode-node-azure-pack', `
              'ms-vsts.team', `
              'msazurermtools.azurerm-vscode-tools', `
              'redhat.vscode-yaml', `
              'vsciot-vscode.azure-iot-toolkit',`
              'yzhang.markdown-all-in-one'

#Install Packages
Set-ExecutionPolicy Bypass -Scope Process -Force
ForEach ($ExtensionName in $Extensions)
{cmd.exe /C "C:\Program Files\Microsoft VS Code\bin\code.cmd" --install-extension $ExtensionName}


#Reboot
Restart-Computer