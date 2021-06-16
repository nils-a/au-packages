$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName= 'chainsaw'

Uninstall-BinFile -Name $packageName

$unpacked = Get-ChildItem -Path $toolsDir -Filter "apache-chainsaw-*" -Directory
$unpacked | ForEach-Object {
    Remove-Item $_.FullName -Recurse -Force
}