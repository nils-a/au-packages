$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.36.0/lazygit_0.36.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.36.0/lazygit_0.36.0_Windows_x86_64.zip'
    checksum      = 'AEB42F6C41ABAE923EA35E5AD3BF76C893C424C06F088AAB92193D6C8F4293F0'
    checksum64    = '25EDCB6EDC0D57EA1FB3E91D917A24BFC4A67D4FCAA1C9A35974873165473F29'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
