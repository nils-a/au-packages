$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.26/lazygit_0.26_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.26/lazygit_0.26_Windows_x86_64.zip'
    checksum      = '65FEBFAF1AE0FF169A0EE4977AF92AD0EABDEA133ECE32D03352A9CF25B7C98E'
    checksum64    = '0A44225132A0DDCAD133C1F7998B73C245DC17296B62DFE4D5C0855FC619E4D9'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
