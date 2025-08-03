$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.54.0/lazygit_0.54.0_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.54.0/lazygit_0.54.0_windows_x86_64.zip'
    checksum      = '742A6BFEA9CB83C9C495C09CB6AF1D2006231B12679271B7BB0B694FA5896847'
    checksum64    = '6DB72B79AFE335ED64955583DB1A2BCD6F57BA404A2F92B6F23B48FAA75DBF5E'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
