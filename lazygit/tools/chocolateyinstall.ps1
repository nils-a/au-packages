$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.37.0/lazygit_0.37.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.37.0/lazygit_0.37.0_Windows_x86_64.zip'
    checksum      = '2670BDC492F67142118A899E6AAE37CE63762AF5DE803235839F3E10ED590DEE'
    checksum64    = '13E126E0A69D5C4D97C9EB8799910AB7489AC0BCDE50B5B5763365217833F94B'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
