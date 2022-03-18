$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.34/lazygit_0.34_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.34/lazygit_0.34_Windows_x86_64.zip'
    checksum      = '2EDC89375F0393608F2F57B9CCDDA8214E27D24F8C9EB609D893ABB16F3A9857'
    checksum64    = 'E5595927CB9072E2134D388294A4AE6036AC09DDF0937AB937F9981D78C14C80'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
