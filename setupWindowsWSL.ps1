function install-wsl-ubuntu {
# Run this script as an Administrator
## Check if the script is running as an Administrator
  if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
# Relaunch the script with Administrator rights
    Start-Process powershell.exe "-File",($MyInvocation.MyCommand.Definition),"-ExecutionPolicy Bypass","-Verb","RunAs"
      exit
  }

# Your script logic here


# Check if WSL is already installed
  $wsl = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

    if ($wsl.State -eq 'Enabled') {
      Write-Host "WSL is already installed."
    } else {
# Enable WSL
      Write-Host "Enabling WSL..."
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

# Enable Virtual Machine Platform feature for WSL 2
        Write-Host "Enabling Virtual Machine Platform feature..."
        Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# Set WSL default version to 2
        wsl --set-default-version 2

# Install the default Linux distribution (Ubuntu)
        Write-Host "Installing Ubuntu..."
        wsl --install -d Ubuntu
    }

# Launch Ubuntu and execute your .sh script
# Assuming your .sh script is located at C:\path\to\your\script.sh
  $scriptPath = "/mnt/c/path/to/your/script.sh"
    wsl bash -c "chmod +x $scriptPath && $scriptPath"
  }
