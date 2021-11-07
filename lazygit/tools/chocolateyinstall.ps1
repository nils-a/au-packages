$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.31.2/lazygit_0.31.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.31.2/lazygit_0.31.2_Windows_x86_64.zip'
    checksum      = '1A978CC070E6E6F26F0DCABC24DE9532B94B51AEDCF0B5C69CB622630400C96F'
    checksum64    = 'D8F00378694B54D81B37BFED5D3135FC5DC9AB1D5C8544AB8979DAD0FB482428'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
