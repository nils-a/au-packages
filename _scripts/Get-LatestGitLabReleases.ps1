
# modified from https://raw.githubusercontent.com/AdmiringWorm/chocolatey-packages/0f3b93ab7b067b265a06349a68297d07b1598e64/scripts/Get-LatestGithubReleases.ps1

function Resolve-LatestGitLabRelease {
    param(
      $response
    )
    $verRegex = "((\d+)(\.\d+){1,3}(\-[a-z]+[0-9]+)?)$";
    $release = $response | ? tag_name -Match $verRegex | select -First 1;

    if (!$release) {
      Write-Debug "No release found."
      return @{};
    }

    $version = $matches[1];
    [array]$assets = $release.assets.sources;
    [array]$assetUrls = $assets | Where-Object { $_.format -Match "^(msi|exe|zip|7z|gz)$" } | Select-Object -expand url;

    return @{
      Name         = $release.name
      Version      = $version
      Assets       = $assetUrls
      ReleaseUrl   = $release._links.self
      Body         = $release.description
    };
  }

  function Get-LatestGitLabRelease {
    param(
      [string]$projectId
    )

    $apiUrl = "https://gitlab.com/api/v4/projects/$($projectId)/releases";

    $headers = @{}

    If (Test-Path Env:\gitlab_api_key) {
      $headers["PRIVATE-TOKEN"] = $env:gitlab_api_key;
    }

    $response = Invoke-RestMethod -Uri $apiUrl -Headers $headers;
    $latestStableRelease = Resolve-LatestGitLabRelease -response $response

    return @{ latestStable = $latestStableRelease };
  }

  function Get-GitLabRepoFiles {
    param(
      [string]$projectId,
      [string]$branch = "main"
    )

    $headers = @{}
    If (Test-Path Env:\gitlab_api_key) {
      $headers["PRIVATE-TOKEN"] = $env:gitlab_api_key;
    }

    $page = 1
    $files = @()
    while($page -gt 0) {
      $apiUrl = "https://gitlab.com/api/v4/projects/$($projectId)/repository/tree?ref=$($branch)&pagination=keyset&per_page=100&page=$($page)";
      $respHeaders = @{}
      $resp = Invoke-RestMethod -Uri $apiUrl -Headers $headers -ResponseHeadersVariable respHeaders;

      $page = $respHeaders["X-Next-Page"]
      $resp | ForEach-Object { $files += $_ }
    }


    return $files
  }