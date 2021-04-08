$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.27.1/lazygit_0.27.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.27.1/lazygit_0.27.1_Windows_x86_64.zip'
    checksum      = 'D8870233401712DDB21B4391D9CC380CEB4D7B170F736CFA6A9EFA7B1BAB11A0'
    checksum64    = 'C11D8FB3649E8C4BA5A8E84EECED0A841F11AB1B3600E4E1BC2B9AF4C5BE6B6A'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
