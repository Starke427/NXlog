# NXlog

NXlog serves as a syslog forwarder for Windows workstations and servers. It can serve a critical role in helping centralize and manage the collection of Windows Eventlogs and, when paired with Sysmon, can aid in aggregating file integrity monitoring and security incident information.

This particular NXlog configuration has been modified to automatically collect the following Windows Event Logs:

* Application
* System
* Security
* Bits-Client/Operational
* Sysmon/Operational
* PowerShell/Operational
* TaskScheduler/Operational
* WMI-Activity/Operational
* Applocker

To tune down data consumption, you can modify the NXlog configuration and remove any unnecessary <Input eventlog> lines.

## Automated NXlog Installation

[nxlog_setup.ps1](https://raw.githubusercontent.com/Starke427/NXlog/master/nxlog_setup.ps1) will download, install, and configure NXlog to forward to a local syslog server. It must be run from an Administrative PowerShell.

You will be prompted to provide the IP of your local syslog server. If you'd like to make this run completely unattended you can download nxlog_setup.ps1 and modify $SERVER_IP to equal the IP of your syslog server.

```
$url1 = "https://raw.githubusercontent.com/Starke427/NXlog/master/nxlog_setup.ps1"
$file1 = "$env:temp\nxlog_setup.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url1, $file1)
Set-ExecutionPolicy -ExecutionPolicy Bypass -force
& "$env:temp\nxlog_setup.ps1"
```
