# NXlog-Config

NXlog serves as a syslog forwarder for Windows workstations and servers. It can serve a critical role in helping centralize and manage the collection of Windows Eventlogs and, when paired with Sysmon, can aid in aggregating file integrity monitoring and security incident information.

This particular NXlog configuration has been modified to automatically forward Sysmon events when available.

## Automated Sysmon Installation

[nxlog_setup.ps1](https://raw.githubusercontent.com/Starke427/NXlog-Config/master/nxlog_setup.ps1) will download, install, and configure NXlog to forward to a local syslog server. It must be run from an Administrative PowerShell.

```
$url1 = "https://raw.githubusercontent.com/Starke427/NXlog-Config/master/nxlog_setup.ps1"
$file1 = "$env:temp\nxlog_setup.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url1, $file1)
Set-ExecutionPolicy -ExecutionPolicy Bypass -force
& "$env:temp\nxlog_setup.ps1"
```

