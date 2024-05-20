$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.42.0/lazygit_0.42.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.42.0/lazygit_0.42.0_Windows_x86_64.zip'
    checksum      = 'D65C9822D61BBB8D7399C7D5AACA76B5376FBF8A6F86FD3A821505CB4AAC93E8'
    checksum64    = 'D2B6591A2DA30B38F90301C0A1054B90875340DA1DA2CCDA9AF6588914C6E7C7'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
