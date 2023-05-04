$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.38.2/lazygit_0.38.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.38.2/lazygit_0.38.2_Windows_x86_64.zip'
    checksum      = 'F4826B78C45BD23F01C2BBAB4F44468A30C3E7E5124C733A4142DC93EB54CF32'
    checksum64    = '5670072670CAFF6A8289A93E87CFB4F187270D235DB94178E6C46891649E30C3'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
