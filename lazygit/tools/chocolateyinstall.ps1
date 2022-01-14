$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.32/lazygit_0.32_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.32/lazygit_0.32_Windows_x86_64.zip'
    checksum      = '88745CF09E464B664FF086C08D21A06B7393250B5A37DCC13B7A4F2C28FC8F76'
    checksum64    = '97BC8DA023C540D3AED3EB14959D62C6685C0CACF65A263DE5D0848CB5B6B469'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
