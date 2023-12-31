# Set execution policy for the session
Set-ExecutionPolicy Bypass -Scope Process -Force
Set-ExecutionPolicy RemoteSigned

# Install package managers
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install packages using Chocolatey
$packages = 'winget', 'powershell-core', 'git', 'gh', 'vscode', 'nodejs.install', 'fzf', 'neovim', 'ripgrep', 
'lazygit', 'bat', 'fd', 'mingw', 'cmake', 'llvm', 'python', 'pyenv-win', 'nerd-fonts-JetBrainsMono', 
'nerd-fonts-Hack'
foreach ($package in $packages)
{
  choco install $package -y
}

# Install NuGet provider for Powershell
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser

# Install packages using winget
$wingetPackages = 'Microsoft.WindowsTerminal', 'Microsoft.PowerToys', 'JanDeDobbeleer.OhMyPosh', 
'Google.Chrome', 'Mozilla.Firefox'
foreach ($app in $wingetPackages)
{
  winget install -e --id=$app -a
}

# Install PowerShell modules
$modules = 'terminal-icons', 'PSReadLine', 'posh-git', 'oh-my-posh', 'PSFzf', 'z'
foreach ($module in $modules)
{
  Install-Module -Name $module -Scope CurrentUser -Force
}

# Install LazyVim Config
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

git clone https://github.com/nxstynate/config_files ~\Downloads

# Configuration settings for PowerShell and Terminal
$configSource = "$env:USERPROFILE\Downloads\config_files"
$nvimConfigSource = "$configSource\neovim\nvim_devaslife_2024\*"
$powerShellConfigSource = "$configSource\windows\PowerShell\*"
$terminalConfigSource = "$configSource\windows\Terminal\settings.json"
$powerToysConfigSource = "$configSource\windows\PowerToys\*"

# Copy items to their respective locations
Copy-Item $nvimConfigSource "$env:LOCALAPPDATA\nvim\." -Force -Recurse
Copy-Item $powerShellConfigSource "$env:USERPROFILE\Documents\PowerShell\" -Force -Recurse
Copy-Item $terminalConfigSource "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force -Recurse
Copy-Item $powerToysConfigSource "$env:LOCALAPPDATA\Microsoft\PowerToys\" -Force -Recurse

# Stop and start PowerToys (if installed and running)
$powerToysProcess = Get-Process -Name "PowerToys" -ErrorAction SilentlyContinue
if ($powerToysProcess)
{
  Stop-Process -Name "PowerToys" -Force
  Start-Process -FilePath "C:\Program Files\PowerToys\PowerToys.exe"
} else
{
  Write-Output "PowerToys is not running. Skipping restart."
}

# Node package managers
npm install -g npm yarn
Invoke-WebRequest https://get.pnpm.io/install.ps1 -useb | Invoke-Expression

# Python package manager
pip install --user pipenv

# WSL installation Ubuntu:
# . .\setupWindowsWSL.ps1
# $response = Read-Host "Do you want to continue? (y/n)"
# if ($response -eq "y") {
#     Write-Host "You chose Yes. Continuing..."
#       install-wsl-ubuntu
# }
# elseif ($response -eq "n") {
#     Write-Host "You chose No. Exiting..."
# }
# else {
#     Write-Host "Invalid response. Please answer with 'Yes' or 'No'."
# }
#
#












