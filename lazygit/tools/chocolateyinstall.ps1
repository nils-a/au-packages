$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.53.0/lazygit_0.53.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.53.0/lazygit_0.53.0_Windows_x86_64.zip'
    checksum      = '554B577F8A152C01F7BC029124F4A5633068B06B50D3AD17E99FDEEF131D4794'
    checksum64    = 'E525C179600A94FC1DCA1B52CA57A281AD25196FF0A2AEE55013E1FE2DAEC943'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
