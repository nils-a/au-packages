$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.27.3/lazygit_0.27.3_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.27.3/lazygit_0.27.3_Windows_x86_64.zip'
    checksum      = '00EE4D3A3885FEEBCD4B6967366EE0E0220F885E7011986BF8876FE653AB6D2C'
    checksum64    = '20CF183AF53112C6F515553355D8CB54399555666D27CE6D8EC3E2AA8CD5DA7D'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
