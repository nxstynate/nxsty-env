# Set execution policy for the session
Set-ExecutionPolicy Bypass -Scope Process -Force

# Install package managers
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install packages using Chocolatey
$packages = 'powershell-core', 'git', 'gh', 'vscode', 'nodejs.install', 'fzf', 'neovim', 'ripgrep', 
'lazygit', 'bat', 'fd', 'mingw', 'cmake', 'llvm', 'python', 'pyenv-win', 'nerd-fonts-JetBrainsMono', 
'nerd-fonts-Hack'
foreach ($package in $packages)
{
  choco install $package -y
}

# Install packages using winget
$wingetPackages = 'Microsoft.WindowsTerminal', 'Microsoft.PowerToys', 'JanDeDobbeleer.OhMyPosh', 
'Google.Chrome', 'Mozilla.Firefox'
foreach ($app in $wingetPackages)
{
  winget install -e --id=$app
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

# Configuration settings for Powershell and Terminal
$configSource = "~\Downloads\config_files"
$nvimConfigSource = "$configSource\neovim\nvim_devaslife_2024\*"
$powerShellConfigSource = "$configSource\windows\PowerShell\"
$terminalConfigSource = "$configSource\windows\Terminal\settings.json"
$powerToysConfigSource = "$configSource\windows\PowerToys\"

Copy-Item $nvimConfigSource "$env:LOCALAPPDATA\nvim\." -Force -Recurse
Copy-Item "$powerShellConfigSource\*" "~\Documents\PowerShell\" -Force -Recurse
Copy-Item $terminalConfigSource "~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force -Recurse
Copy-Item "$powerToysConfigSource\*" "~\AppData\Local\Microsoft\PowerToys\" -Force -Recurse

Remove-Item $configSource -Recurse -Force

# Restart PowerToys to apply new settings
Stop-Process -Name "PowerToys" -Force
Start-Process -FilePath "C:\Program Files\PowerToys\PowerToys.exe"

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



