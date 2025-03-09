# PowerShell setup script for development environment

# Refresh environment variables.
function Restart-Environment
{
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}


# Set execution policy for this session
Set-ExecutionPolicy Bypass -Scope Process -Force

# Install NuGet provider for PowerShell
try
{
  Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
} catch
{
  Write-Error "Failed to install NuGet provider."
  exit
}

# Install Chocolatey and Scoop
try
{
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
  if (-not (Get-Command "choco" -ErrorAction SilentlyContinue))
  {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
  }
  if (-not (Test-Path "~\scoop"))
  {
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
  }
} catch
{
  Write-Error "Failed to install Chocolatey and/or Scoop."
  exit
}

# Install packages using Chocolatey
$chocoPackages = 'winget', 'powershell-core', 'git', 'gh', 'vscode', 'nodejs.install', 'fzf', 'neovim', 'ripgrep', 
'lazygit', 'bat', 'fd', 'mingw', 'cmake', 'llvm', 'python', 'pyenv-win', 'nerd-fonts-JetBrainsMono', 
'nerd-fonts-Hack', 'nerd-fonts-CascadiaMono', 'wezterm'
foreach ($package in $chocoPackages)
{
  choco install $package -y
}

Restart-Environment

# Install packages using winget
$wingetPackages = 'Microsoft.WindowsTerminal', 'Microsoft.PowerToys', 'JanDeDobbeleer.OhMyPosh', 'starship',
'Google.Chrome', 'Mozilla.Firefox'
foreach ($app in $wingetPackages)
{
  winget install --id=$app --silent 
}

Restart-Environment

# Install PowerShell modules
$psModules = 'terminal-icons', 'PSReadLine', 'posh-git', 'PSFzf', 'z'
foreach ($module in $psModules)
{
  Install-Module -Name $module -Scope CurrentUser -Force 
}

Restart-Environment

# Clone and configure LazyVim
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

# Clone user configuration files
git clone https://github.com/nxstynate/config_files $env:USERPROFILE\Downloads\config_files

# Configuration settings for PowerShell and Terminal
$configSource = "$env:USERPROFILE\Downloads\config_files"
$nvimConfigSource = "$configSource\neovim\nvim_devaslife_2024\*"
$powerShellConfigSource = "$configSource\windows\PowerShell\*"
$terminalConfigSource = "$configSource\windows\Terminal\settings.json"
$powerToysConfigSource = "$configSource\windows\PowerToys\*"
$starshipConfigSource = "$configSource\windows\starship.toml"


# Copy configuration files to respective locations
Copy-Item $nvimConfigSource "$env:LOCALAPPDATA\nvim\." -Force -Recurse
Copy-Item $powerShellConfigSource "$env:USERPROFILE\Documents\PowerShell\" -Force -Recurse
Copy-Item $terminalConfigSource "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force -Recurse
Copy-Item $powerToysConfigSource "$env:LOCALAPPDATA\Microsoft\PowerToys\" -Force -Recurse
Copy-Item $starshipConfigSource "$HOME\example\non\default\path\starship.toml" -Force -Recurse

# Restart PowerToys if running
$powerToysProcess = Get-Process -Name "PowerToys" -ErrorAction SilentlyContinue
if ($powerToysProcess)
{
  Stop-Process -Name "PowerToys" -Force
  Start-Process -FilePath "C:\Program Files\PowerToys\PowerToys.exe"
} else
{
  Write-Output "PowerToys is not running. Skipping restart."
}

# Install global Node packages
npm install -g npm yarn
Invoke-WebRequest https://get.pnpm.io/install.ps1 -useb | Invoke-Expression

# Install Python pipenv
pip install --user pipenv

# Optional WSL installation (commented out)
# . .\setupWindowsWSL.ps1
# $response = Read-Host "Do you want to continue? (y/n)"
# if ($response -eq "y") {
#     Write-Host "You chose Yes. Continuing..."
#     install-wsl-ubuntu
# }
# elseif ($response -eq "n") {
#     Write-Host "You chose No. Exiting..."
# }
# else {
#     Write-Host "Invalid response. Please answer with 'Yes' or 'No'."
# }

Pause







