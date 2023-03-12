@echo off

REM Define the URL for the XMRig installer
set XMRIG_INSTALLER_URL=https://github.com/xmrig/xmrig/releases/download/v6.17.2/xmrig-6.17.2-win64.zip

REM Define the directory where the XMRig software will be installed
set XMRIG_INSTALL_DIR=C:\Users\xmrig

REM Download and extract the XMRig installer
powershell -Command "(New-Object Net.WebClient).DownloadFile('%XMRIG_INSTALLER_URL%', 'xmrig.zip')"
powershell -Command "Expand-Archive -Path 'xmrig.zip' -DestinationPath '%XMRIG_INSTALL_DIR%'"

REM Configure XMRig to mine to your Monero wallet address
set XMRIG_CONFIG=%XMRIG_INSTALL_DIR%\config.json
set XMRIG_POOL_URL=stratum+tcp://pool.supportxmr.com:3333
set XMRIG_WALLET=<88aCHiyfVxubu24w6PbF9dg4Cy4YWP5LMHyzXzT3eBoAK2iKJFedisyWUYJgcehkFk3R5wU1WENJEGGaVAo9rxfqSYaqZJr>
set XMRIG_PASSWORD=x
powershell -Command "(Get-Content '%XMRIG_CONFIG%') -replace 'pool.supportxmr.com:3333', '%XMRIG_POOL_URL%' -replace '<YOUR_MONERO_WALLET_ADDRESS>', '%XMRIG_WALLET%' -replace 'x', '%XMRIG_PASSWORD%' | Set-Content '%XMRIG_CONFIG%'"

REM Start XMRig
start "" "%XMRIG_INSTALL_DIR%\xmrig.exe" --config=%XMRIG_CONFIG%
