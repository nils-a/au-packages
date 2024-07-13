$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.43.0/lazygit_0.43.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.43.0/lazygit_0.43.0_Windows_x86_64.zip'
    checksum      = 'B41EFFA831E9D112A17A75F2F7B18B3544990ADBA5BAB4AC091379B1BEACBC59'
    checksum64    = 'A810D5968B53FDE8AED5D6889C6BBF4BF5C04BC72A5650847C7FDFD3A247A747'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
