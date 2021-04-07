# Install Chocolatey
Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) 

# Install Git
choco install git -y

if (($env:Path.Split(';') -contains "C:\Program Files\Git\bin") -eq $false) {
    $env:Path += ";C:\Program Files\Git\bin";
    [System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine );
}

git config --global user.name "Anthony Watts"
git config --global user.email "awatts@internal.colt.net"

# Install powershell
choco install powershell -y

# Setup machine
# Show File Extensions
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 0
Stop-Process -processname explorer

############################### Set UK English

# Install PSGet
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | Invoke-Expression
install-module pscx

# Install More Git Stuff
choco install git-credential-winstore -y

# Install Browsers
choco install googlechrome -y

# Install System Utils
choco install sysinternals -y
choco install procexp -y
choco install fiddler -y
choco install 7zip.install -y
choco install docker-desktop -y

# Install Terminal Tools
choco install microsoft-windows-terminal -y
choco install poshgit -y
choco install nuget.commandline -y
choco install powershell-core -y
choco install azure-cli -y
choco install fira hackfont ubuntu.font robotofonts cascadiacode -y

choco install oh-my-posh --version=2.0.496
Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module oh-my-posh
Invoke-Expression (oh-my-posh --init --shell pwsh)
Set-PoshPrompt -Theme jandedobbeleer 
######### Make theme PowerlineAPW

# Install Programming languages, IDEs & Extensions
choco install python3 -y
########################### Add python to PATH?
choco install notepadplusplus.install -y
choco install visualstudiocode -y
choco install azurefunctions-vscode -y
choco install vscode-csharp -y
choco install vscode-jupyter -y
choco install jetbrainstoolbox -y
choco install visualstudio2019professional -y
choco install resharper -y

# Chocolatey - Data Tools
choco install sql-server-management-studio -y
choco install microsoftazurestorageexplorer -y

Restart-Computer -Confirm