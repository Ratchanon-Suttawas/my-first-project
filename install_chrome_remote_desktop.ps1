# กำหนด URL ของโปรแกรมติดตั้ง
$installerUrl = "https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi"

# กำหนดพาธของไฟล์ติดตั้ง
$installerPath = "$env:TEMP\chromeremotedesktophost.msi"

# ดาวน์โหลดโปรแกรมติดตั้ง
Write-Host "Downloading Chrome Remote Desktop installer..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# ติดตั้งโปรแกรม
Write-Host "Installing Chrome Remote Desktop..."
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$installerPath`" /qn /norestart" -Wait

# กำหนดค่า Chrome Remote Desktop
Write-Host "Configuring Chrome Remote Desktop..."
$remotingPath = "${Env:PROGRAMFILES(X86)}\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe"
$code = "4/0AQSTgQFfIFpMVnrcwc3Kzw8Aufuk7pSTNKyduS-VjSQMdjLhfM0i4b5akCcbIZEV2iABrA"
$redirectUrl = "https://remotedesktop.google.com/_/oauthredirect"
$computerName = $env:COMPUTERNAME

Start-Process -FilePath $remotingPath -ArgumentList "--code=`"$code`" --redirect-url=`"$redirectUrl`" --name=`"$computerName`"" -Wait

# ลบไฟล์ติดตั้ง (ถ้าต้องการ)
# Remove-Item $installerPath

Write-Host "Chrome Remote Desktop has been installed and configured."
