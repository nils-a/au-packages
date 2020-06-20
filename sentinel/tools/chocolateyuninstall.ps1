$ErrorActionPreference = 'Stop';

$uninstall = $(Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\Sentinel).QuietUninstallString
Write-Verbose "Calling Squirrel uninstall: ""$uninstall"""
Invoke-Expression ".$uninstall"