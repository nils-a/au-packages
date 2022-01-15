$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.32.1/lazygit_0.32.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.32.1/lazygit_0.32.1_Windows_x86_64.zip'
    checksum      = 'E2C4FF2FEE0C0BF58305A5A14CFD08199C0A6183C5259C621863CC30D1474AA6'
    checksum64    = '000A2A2002ED8054C05151CECA340DFC0EBCE8615B4C5BB2497FC6FAFD7E441A'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
