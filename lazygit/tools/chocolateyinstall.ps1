$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.51.1/lazygit_0.51.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.51.1/lazygit_0.51.1_Windows_x86_64.zip'
    checksum      = '8578A9AD119D6B01DF05E84375D7B18D1C4E1E6A5F9320750596D6CF88A06506'
    checksum64    = 'BF2406E5B6762F4087DA4AF083426803E5EFB0592A10EC13AE8A0E338A76CB35'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
