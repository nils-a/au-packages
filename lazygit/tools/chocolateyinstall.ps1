$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/lazygit_0.44.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/lazygit_0.44.1_Windows_x86_64.zip'
    checksum      = '1E090B85E90199D8E9D72DDE8189B8CFC630D09A4016F65C0E3CDAE73C8FFDE1'
    checksum64    = '858EF73CCC277C76A7C6278602C1E22B92DC250F45D6722C46F221FED128C15A'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
