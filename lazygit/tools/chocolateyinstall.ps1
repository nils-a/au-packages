$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.31.4/lazygit_0.31.4_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.31.4/lazygit_0.31.4_Windows_x86_64.zip'
    checksum      = '3223F4D45463373501583A7BC640553B620B2A2D110CE04398F290F89E0F8AA6'
    checksum64    = 'FB3E8B456BFCB53750AA6FE80453F2AB0C040B9F1317E050CB2B14B094CF95E4'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
