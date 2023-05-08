$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installLog = Join-Path -Path $toolsDir -ChildPath "installed.txt"

# if the package was force-installed multiple times
# the list of installed fonts will be empty and uninstall will
# not remove all that was installed.
# Hence, I hard-coded the current font-names here for backup.
#TODO: creating this list should be automated on package-creation.
$staticNames = @(
 "JetBrainsMonoNerdFont-Bold.ttf",
 "JetBrainsMonoNerdFont-BoldItalic.ttf",
 "JetBrainsMonoNerdFont-ExtraBold.ttf",
 "JetBrainsMonoNerdFont-ExtraBoldItalic.ttf",
 "JetBrainsMonoNerdFont-ExtraLight.ttf",
 "JetBrainsMonoNerdFont-ExtraLightItalic.ttf",
 "JetBrainsMonoNerdFont-Italic.ttf",
 "JetBrainsMonoNerdFont-Light.ttf",
 "JetBrainsMonoNerdFont-LightItalic.ttf",
 "JetBrainsMonoNerdFont-Medium.ttf",
 "JetBrainsMonoNerdFont-MediumItalic.ttf",
 "JetBrainsMonoNerdFont-Regular.ttf",
 "JetBrainsMonoNerdFont-SemiBold.ttf",
 "JetBrainsMonoNerdFont-SemiBoldItalic.ttf",
 "JetBrainsMonoNerdFont-Thin.ttf",
 "JetBrainsMonoNerdFont-ThinItalic.ttf",
 "JetBrainsMonoNerdFontMono-Bold.ttf",
 "JetBrainsMonoNerdFontMono-BoldItalic.ttf",
 "JetBrainsMonoNerdFontMono-ExtraBold.ttf",
 "JetBrainsMonoNerdFontMono-ExtraBoldItalic.ttf",
 "JetBrainsMonoNerdFontMono-ExtraLight.ttf",
 "JetBrainsMonoNerdFontMono-ExtraLightItalic.ttf",
 "JetBrainsMonoNerdFontMono-Italic.ttf",
 "JetBrainsMonoNerdFontMono-Light.ttf",
 "JetBrainsMonoNerdFontMono-LightItalic.ttf",
 "JetBrainsMonoNerdFontMono-Medium.ttf",
 "JetBrainsMonoNerdFontMono-MediumItalic.ttf",
 "JetBrainsMonoNerdFontMono-Regular.ttf",
 "JetBrainsMonoNerdFontMono-SemiBold.ttf",
 "JetBrainsMonoNerdFontMono-SemiBoldItalic.ttf",
 "JetBrainsMonoNerdFontMono-Thin.ttf",
 "JetBrainsMonoNerdFontMono-ThinItalic.ttf",
 "JetBrainsMonoNerdFontPropo-Bold.ttf",
 "JetBrainsMonoNerdFontPropo-BoldItalic.ttf",
 "JetBrainsMonoNerdFontPropo-ExtraBold.ttf",
 "JetBrainsMonoNerdFontPropo-ExtraBoldItalic.ttf",
 "JetBrainsMonoNerdFontPropo-ExtraLight.ttf",
 "JetBrainsMonoNerdFontPropo-ExtraLightItalic.ttf",
 "JetBrainsMonoNerdFontPropo-Italic.ttf",
 "JetBrainsMonoNerdFontPropo-Light.ttf",
 "JetBrainsMonoNerdFontPropo-LightItalic.ttf",
 "JetBrainsMonoNerdFontPropo-Medium.ttf",
 "JetBrainsMonoNerdFontPropo-MediumItalic.ttf",
 "JetBrainsMonoNerdFontPropo-Regular.ttf",
 "JetBrainsMonoNerdFontPropo-SemiBold.ttf",
 "JetBrainsMonoNerdFontPropo-SemiBoldItalic.ttf",
 "JetBrainsMonoNerdFontPropo-Thin.ttf",
 "JetBrainsMonoNerdFontPropo-ThinItalic.ttf",
 "JetBrainsMonoNLNerdFont-Bold.ttf",
 "JetBrainsMonoNLNerdFont-BoldItalic.ttf",
 "JetBrainsMonoNLNerdFont-ExtraBold.ttf",
 "JetBrainsMonoNLNerdFont-ExtraBoldItalic.ttf",
 "JetBrainsMonoNLNerdFont-ExtraLight.ttf",
 "JetBrainsMonoNLNerdFont-ExtraLightItalic.ttf",
 "JetBrainsMonoNLNerdFont-Italic.ttf",
 "JetBrainsMonoNLNerdFont-Light.ttf",
 "JetBrainsMonoNLNerdFont-LightItalic.ttf",
 "JetBrainsMonoNLNerdFont-Medium.ttf",
 "JetBrainsMonoNLNerdFont-MediumItalic.ttf",
 "JetBrainsMonoNLNerdFont-Regular.ttf",
 "JetBrainsMonoNLNerdFont-SemiBold.ttf",
 "JetBrainsMonoNLNerdFont-SemiBoldItalic.ttf",
 "JetBrainsMonoNLNerdFont-Thin.ttf",
 "JetBrainsMonoNLNerdFont-ThinItalic.ttf",
 "JetBrainsMonoNLNerdFontMono-Bold.ttf",
 "JetBrainsMonoNLNerdFontMono-BoldItalic.ttf",
 "JetBrainsMonoNLNerdFontMono-ExtraBold.ttf",
 "JetBrainsMonoNLNerdFontMono-ExtraBoldItalic.ttf",
 "JetBrainsMonoNLNerdFontMono-ExtraLight.ttf",
 "JetBrainsMonoNLNerdFontMono-ExtraLightItalic.ttf",
 "JetBrainsMonoNLNerdFontMono-Italic.ttf",
 "JetBrainsMonoNLNerdFontMono-Light.ttf",
 "JetBrainsMonoNLNerdFontMono-LightItalic.ttf",
 "JetBrainsMonoNLNerdFontMono-Medium.ttf",
 "JetBrainsMonoNLNerdFontMono-MediumItalic.ttf",
 "JetBrainsMonoNLNerdFontMono-Regular.ttf",
 "JetBrainsMonoNLNerdFontMono-SemiBold.ttf",
 "JetBrainsMonoNLNerdFontMono-SemiBoldItalic.ttf",
 "JetBrainsMonoNLNerdFontMono-Thin.ttf",
 "JetBrainsMonoNLNerdFontMono-ThinItalic.ttf",
 "JetBrainsMonoNLNerdFontPropo-Bold.ttf",
 "JetBrainsMonoNLNerdFontPropo-BoldItalic.ttf",
 "JetBrainsMonoNLNerdFontPropo-ExtraBold.ttf",
 "JetBrainsMonoNLNerdFontPropo-ExtraBoldItalic.ttf",
 "JetBrainsMonoNLNerdFontPropo-ExtraLight.ttf",
 "JetBrainsMonoNLNerdFontPropo-ExtraLightItalic.ttf",
 "JetBrainsMonoNLNerdFontPropo-Italic.ttf",
 "JetBrainsMonoNLNerdFontPropo-Light.ttf",
 "JetBrainsMonoNLNerdFontPropo-LightItalic.ttf",
 "JetBrainsMonoNLNerdFontPropo-Medium.ttf",
 "JetBrainsMonoNLNerdFontPropo-MediumItalic.ttf",
 "JetBrainsMonoNLNerdFontPropo-Regular.ttf",
 "JetBrainsMonoNLNerdFontPropo-SemiBold.ttf",
 "JetBrainsMonoNLNerdFontPropo-SemiBoldItalic.ttf",
 "JetBrainsMonoNLNerdFontPropo-Thin.ttf",
 "JetBrainsMonoNLNerdFontPropo-ThinItalic.ttf"
)

$toUninstall = @()
if(Test-Path $installLog) {
  $toUninstall = Get-Content $installLog -Encoding unicode
}


if($toUninstall.length -lt 1) {
  $toUninstall = $staticNames
}

$removed = Uninstall-ChocolateyFont $toUninstall -Multiple
Write-Debug "Removed $removed previously installed fonts."
