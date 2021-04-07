$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.27/lazygit_0.27_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.27/lazygit_0.27_Windows_x86_64.zip'
    checksum      = 'F7BA8AE1E877351F7EF61CB25C95E06FD8C58ECAD7A03E2895D0E5050CDD81D0'
    checksum64    = '99BBF309AE281D91A1F6144059026B8F7E2E7CC91B8775A09DB8612C6118185D'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
