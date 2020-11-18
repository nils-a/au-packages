$ErrorActionPreference = 'Stop';

$packageName= 'smtp4dev'

Write-Verbose "Removing shim"
Uninstall-BinFile `
  -Name $packageName