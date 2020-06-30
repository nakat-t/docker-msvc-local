# escape=`

# Use the latest Windows Server Core image with .NET Framework 4.8.
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019

# Install tool versions used in install.ps1
ENV GIT_VERSION="2.27.0" `
    MAKE_VERSION="4.3" `
    SVN_VERSION="1.8.15"

# Copy Install scripts.
COPY install.ps1 vcinstall.bat C:\DockerBuild\

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Install basic development tools.
RUN powershell -ExecutionPolicy Bypass -File "C:\DockerBuild\install.ps1"

# Download the Build Tools bootstrapper.
ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\DockerBuild\vs_buildtools.exe

# Install Build Tools with the Microsoft.VisualStudio.Workload.AzureBuildTools workload, excluding workloads and components with known issues.
RUN C:\DockerBuild\vcinstall.bat C:\DockerBuild\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --installPath C:\BuildTools `
    --add Microsoft.VisualStudio.Workload.MSBuildTools `
    --add Microsoft.VisualStudio.Workload.VCTools `
    --includeRecommended `
    --remove Microsoft.VisualStudio.Component.Windows10SDK.10240 `
    --remove Microsoft.VisualStudio.Component.Windows10SDK.10586 `
    --remove Microsoft.VisualStudio.Component.Windows10SDK.14393 `
    --remove Microsoft.VisualStudio.Component.Windows81SDK

# Define the entry point for the docker container.
# This entry point starts the developer command prompt and launches the PowerShell shell.
ENTRYPOINT ["C:\\BuildTools\\Common7\\Tools\\VsDevCmd.bat", "&&", "powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]

# Defines a directory for mounting the host source code.
WORKDIR C:\Data
