$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.40.0/lazygit_0.40.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.40.0/lazygit_0.40.0_Windows_x86_64.zip'
    checksum      = '112F25239AA65D9BC73EB41F9C9B3DE5003C76D218993EDA9DAD1AE85B21C9F4'
    checksum64    = '6D7539BF97F05BDE477782574EA644375CC75684F4430C62E45851FF86711EC5'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
