. $PSScriptRoot\..\chrysalis.portable\update.ps1

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).portable`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 4 -SkipLast 1 }

update -ChecksumFor none