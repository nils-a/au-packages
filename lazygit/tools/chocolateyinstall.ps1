$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.43.1/lazygit_0.43.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.43.1/lazygit_0.43.1_Windows_x86_64.zip'
    checksum      = '6CECAFB7254904E44726800069A7CBFA96C50DBFB6D63032628979916CA05B0E'
    checksum64    = '360810E810C321A1BAED6279AF57372D0D7DCC99AB446D74DB4383F63BE83291'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
