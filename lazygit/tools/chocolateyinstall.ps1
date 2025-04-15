$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.49.0/lazygit_0.49.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.49.0/lazygit_0.49.0_Windows_x86_64.zip'
    checksum      = '70719F47208890576407A83CE310C07EE0F64B275041ED09D8347E1D407D241F'
    checksum64    = 'C93E2937A039F0FEA984BB6738E8D6130E6580FE5916C8BED7220CDCE34FCEE5'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
