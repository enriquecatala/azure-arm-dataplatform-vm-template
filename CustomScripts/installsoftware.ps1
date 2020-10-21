<# 
    Author:  Enrique Catalá Bañuls
             enrique@enriquecatala.com
             https://enriquecatala.com
             https://youtube.com/enriquecatala
             https://www.linkedin.com/in/enriquecatala
             
    
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
            # Visual Studio 2019 with database extensions will take some time...if you don´t need it, leave this commented
            #
            #'visualstudio2019community',
            #'visualstudio2019-workload-data',
            #'visualstudio2019-workload-databuildtools',
            #'visualstudio2019-workload-datascience',
            
            

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Install Visual Studio Code Extensions
$vsExtensions = 'ms-python.python',`
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
              'ms-vscode-remote.vscode-remote-extensionpack',`
              'ms-vscode-remote.remote-containers',`
              'ms-vscode-remote.remote-ssh',`
              'ms-vsts.team', `
              'msazurermtools.azurerm-vscode-tools', `
              'redhat.vscode-yaml', `
              'vsciot-vscode.azure-iot-toolkit',`
              'yzhang.markdown-all-in-one',`
              'jithurjacob.nbpreviewer',`
              'mhutchie.git-graph',`
              'zbecknell.t4-support',`
              'bencoleman.armview',`
              'github.vscode-pull-request-github'

#Install Visual Studio Code Packages
Set-ExecutionPolicy Bypass -Scope Process -Force
ForEach ($ExtensionName in $vsExtensions)
{cmd.exe /C 'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extension $ExtensionName}
#{cmd.exe /C 'C:\Users\ecatala\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd' --install-extension $ExtensionName}


#Install Azure Data StudioExtensions
$adsExtensions = 'microsoft.admin-pack',`
              'microsoft.datavirtualization', `
              'microsoft.admin-tool-ext-win', `
              'microsoft.managed-instance-dashboard', `
              'microsoft.powershell', `
              'redgate.sql-prompt', `
              'microsoft.server-report', `
              'microsoft.sql-assessment', `
              'microsoft.agent', `
              'microsoft.cms', `
              'microsoft.dacpac', `
              'microsoft.import', `
              'microsoft.profiler', `
              'microsoft.schema-compare', `
              'kevcunnane.ssmskeymap'

# 
ForEach ($ExtensionName in $adsExtensions)
{cmd.exe /C 'C:\Program Files\Azure Data Studio\bin\azuredatastudio.cmd' --install-extension $ExtensionName}
#{cmd.exe /C 'C:\Users\ecatala\AppData\Local\Programs\Azure Data Studio\bin\code.cmd' --install-extension $ExtensionName}


#Reboot
Restart-Computer