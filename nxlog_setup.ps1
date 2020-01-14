# Download, install, and configure NXlog to forward to a local syslog server.
# User will be prompted for syslog server when run. This can be hard-coded for unattended installations.
#
# Author: Jeff Starke

$url1 = "https://nxlog.co/system/files/products/files/348/nxlog-ce-2.10.2150.msi"
$file1 = "C:\nxlog-ce-2.10.2150.msi"

$url2 = "https://raw.githubusercontent.com/Starke427/AlienVault/master/nxlog.conf"
$file2 = "C:\Program Files (x86)\nxlog\conf\nxlog.conf"

$SERVER_IP = Read-Host -Prompt 'What is the IP of your syslog server? '

# Download and install nxlog
(New-Object -TypeName System.Net.WebClient).DownloadFile($url1, $file1)
Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/i C:\nxlog-ce-2.10.2150.msi /q" -wait

# Download and modify nxlog configuration and restart nxlog
(New-Object -TypeName System.Net.WebClient).DownloadFile($url2, $file2)
(Get-Content "C:\Program Files (x86)\nxlog\conf\nxlog.conf").replace("CHANGEME", $SERVER_IP) | Set-Content "C:\Program Files (x86)\nxlog\conf\nxlog.conf"
Restart-Service -Name nxlog
