#
# This installation script is based on github.com/mabrarov/build-scripts.
# see: https://github.com/mabrarov/build-scripts/blob/master/docker/windows-dev/src/app/install.ps1
# see: install.ps1.LICENSE
#

# Stop immediately if any error happens
$ErrorActionPreference = "Stop"

# Enable all versions of TLS
[System.Net.ServicePointManager]::SecurityProtocol = @("Tls12","Tls11","Tls","Ssl3")

# Install Chocolatey package manager
Write-Host "Installing Chocolatey package manager"
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host "Chocolatey package manager installed"

# Install GNU Make
& choco install make -y --no-progress --version "${env:MAKE_VERSION}" --force
if (${LastExitCode} -ne 0) {
  throw "Failed to install GNU Make ${env:MAKE_VERSION}"
}
Write-Host "GNU Make ${env:MAKE_VERSION} installed"

# Install Git for Windows
& choco install git -y --no-progress --version "${env:GIT_VERSION}" --force -params "'/NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration'"
if (${LastExitCode} -ne 0) {
  throw "Failed to install Git ${env:GIT_VERSION}"
}
Write-Host "Git ${env:GIT_VERSION} installed"

# Install Subversion for Windows
& choco install svn -y --no-progress --version "${env:SVN_VERSION}" --force
if (${LastExitCode} -ne 0) {
  throw "Failed to install Subversion for Windows ${env:SVN_VERSION}"
}
Write-Host "Subversion for Windows ${env:SVN_VERSION} installed"

# Cleanup
Write-Host "Removing all files and directories from ${env:TMP}"
Remove-Item -Path "${env:TMP}\*" -Recurse -Force
