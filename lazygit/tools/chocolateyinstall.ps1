$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Windows_x86_64.zip'
    checksum      = 'C8BC0AF48CC61FE44C335D507CE88E055857B0C224BABEC5BD4F3842A0B4106C'
    checksum64    = 'B6CBA66450D4B1138D5F817261D2E9070C3C8A34220D886E360F576673BDDD0D'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
