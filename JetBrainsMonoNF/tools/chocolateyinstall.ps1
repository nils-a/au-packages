$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installLog = Join-Path -Path $toolsDir -ChildPath "installed.txt"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip'
    checksum      = 'CCAA9C2625A20B47BC253CCD1D59A6F726CEE8922D5B9B52C197364D36E9EEEB'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$fontsFolder = (New-Object -ComObject Shell.Application).namespace(0x14).self.path
$nerdFontsBeforeInstall = Get-ChildItem -Path $fontsFolder -Filter "JetBrains Mono*Nerd Font*.ttf" | select -ExpandProperty Name

$fonts = Get-ChildItem $toolsDir -Filter "*Windows Compatible.ttf"
$paths = $fonts | select -ExpandProperty FullName
$names = $fonts | select -ExpandProperty Name
Write-Debug "Installing the following fonts`r`n - $($names -join "`r`n - ")"

$added = Install-ChocolateyFont $paths -Multiple
Write-Debug "Installed $added fonts."

$nerdFontsAfterInstall = Get-ChildItem -Path $fontsFolder -Filter "JetBrains Mono*Nerd Font*.ttf" | select -ExpandProperty Name
$newlyInstalledFonts = $nerdFontsAfterInstall | Where-Object { $nerdFontsBeforeInstall -notcontains $_ }
$newlyInstalledFonts | Out-File $installLog -Encoding unicode -Append
