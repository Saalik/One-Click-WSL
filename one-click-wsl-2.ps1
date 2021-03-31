echo "Running command : Enabling Microsoft-Windows-Subsystem-Linux"

Start-Process wpr -verb runAs -Args "dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart"

echo "Done"

echo "Running command : Enabling VirtualMachinePlatform"

Start-Process wpr -verb runAs -Args "dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart"

echo "Done"

echo "Downloading and launching wsl update package"

Invoke-WebRequest -Uri "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -OutFile "C:\Users\$env:UserName\AppData\Local\Temp\wsl.msi"
Invoke-Item "C:\Users\$env:UserName\AppData\Local\Temp\wsl.msi"

echo "Done"


echo "Setting up wsl version 2 as default"

Start-Process wpr -verb runAs -Args "wsl --set-default-version 2"

echo "Done"


read-host "Press any key to finish..."
