cls

# Install Chocolatey
Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) 

# Configure Package Sources
Install-PackageProvider -Name Nuget -MinimumVersion 2.8.5.201 -Force
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

# Install Git
choco install git -y --no-progress

if (($env:Path.Split(';') -contains "C:\Program Files\Git\bin") -eq $false) {
    $env:Path += ";C:\Program Files\Git\bin";
    [System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine );
}

git config --global user.name "Anthony Watts"
git config --global user.email "anthonypwatts@gmail.com"

# Setup machine
# Show File Extensions
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 0
Stop-Process -Name explorer

############################### Set UK English

# Install Browsers
choco install googlechrome -y --no-progress

# Install System Utils
choco install sysinternals -y --no-progress
choco install procexp -y --no-progress
choco install fiddler -y --no-progress
choco install 7zip.install -y --no-progress
choco install docker-desktop -y --no-progress

# Install Terminal Tools
choco install microsoft-windows-terminal -y --no-progress
choco install poshgit -y --no-progress
choco install nuget.commandline -y --no-progress
choco install powershell-core -y --no-progress
choco install azure-cli -y --no-progress
choco install fira hackfont ubuntu.font robotofonts cascadiacode -y --no-progress

choco install oh-my-posh --version=2.0.496 -y --no-progress
Install-Module oh-my-posh
Invoke-Expression (oh-my-posh --init --shell pwsh)
Set-PoshPrompt -Theme jandedobbeleer 
######### Make theme PowerlineAPW

# Install Programming languages, IDEs & Extensions
choco install python3 -y --no-progress
########################### Add python to PATH?
choco install notepadplusplus.install -y --no-progress
choco install visualstudiocode -y --no-progress
choco install azurefunctions-vscode -y --no-progress
choco install vscode-csharp -y --no-progress
choco install vscode-jupyter -y --no-progress
choco install jetbrainstoolbox -y --no-progress
choco install visualstudio2019professional -y --no-progress
choco install resharper -y --no-progress

# Install Data Tools
choco install sql-server-management-studio -y --no-progress
choco install microsoftazurestorageexplorer -y --no-progress

# Install Utilities
choco install keepass -y --no-progress
choco install rdmfree -y --no-progress
choco install github-desktop -y --no-progress

Restart-Computer -Confirm