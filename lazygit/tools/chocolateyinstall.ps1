$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.28.1/lazygit_0.28.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.28.1/lazygit_0.28.1_Windows_x86_64.zip'
    checksum      = '09AB7C4C2698275B96759497D53DE1539112D6EF70A96DCD18C274E29AAF961A'
    checksum64    = 'ADE3BA7A3BD2B03B7C4B1054DFF197E5F97766F40290129EE0737A8B6E49F2A7'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
