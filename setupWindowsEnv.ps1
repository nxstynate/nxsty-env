# Install chocolatey:
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install scoop:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install packages:
choco install powershell-core -y
choco install git -y
choco install gh -y
choco install vscode -y
choco install nodejs.install -y
choco install fzf -y
choco install neovim -y 
choco install ripgrep -y
choco install lazygit -y
choco install bat -y
choco install fd -y
chcoo install mingw -y
choco install cmake -y
choco install llvm -y
choco install python -y
choco install pyenv-win -y
choco install nerd-fonts-JetBrainsMono -y
choco iinstall nerd-fonts-Hack -y

winget install -e --id=Microsoft.WindowsTerminal
winget install -e --id=Microsoft.PowerToys
winget install -e --id=JanDeDobbeleer.OhMyPosh -s winget
winget install -e --id=Google.Chrome
winget install -e --id=Mozilla.Firefox

install-module terminal-icons -scope currentuser
install-module PSReadLine -scope currentuser
install-module posh-git -scope currentuser
install-module oh-my-posh -scope currentuser
install-module PSFzf -scope currentuser
install-module -name z -scope currentuser

# Install LazyVim Config:
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

# Configuration settings for Powershell and Terminal:
git clone https://github.com/nxstynate/config_files ~\Downloads\
Copy-Item "~\Downloads\config_files\neovim\nvim_devaslife_2024\*" "$env:LOCALAPPDATA\nvim\." -Force -Recurse
Copy-Item "~\Downloads\config_files\windows\PowerShell\Microsoft.PowerShell_profile.ps1" "~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Force -Recurse
Copy-Item "~\Downloads\config_files\windows\PowerShell\powershell.config.json" "~\Documents\PowerShell\powershell.config.json" -Force -Recurse
Copy-Item "~\Downloads\config_files\windows\PowerShell\takuya.omp.json" "~\Documents\PowerShell\takuya.omp.json" -Force -Recurse
Copy-Item "~\Downloads\config_files\windows\PowerShell\takuya.omp.json.bak" "~\Documents\PowerShell\takuya.omp.json.bak" -Force -Recurse
Copy-Item "~\Downloads\config_files\windows\Terminal\settings.json" "~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force -Recurse
Copy-Item "~\Downloads\config_files\windows\PowerToys\KeyboardManager\default.json" "~\AppData\Local\Microsoft\PowerToys\Keyboard Manager\default.json" -Force -Recurse
Copy-Item "~\Downloads\config_files\windows\PowerToys\settings.json" "~\AppData\Local\Microsoft\PowerToys\settings.json" -Force -Recurse

Remote-Item "~\Downloads\config_files" -Recurse -Force

Stop-Process -Name "PowerToys" -Force
Start-Porcess -FilePath "C:\Program Files\PowerToys\PowerToys.exe"

# Node package managers:
npm install -g npm 
npm install -global yarn
Invoke-WebRequest https://get.pnpm.io/install.ps1 -useb | Invoke-Expression

# Python package managers:
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



