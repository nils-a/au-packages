function global:Invoke-WithRetry {
    param(
        [Parameter(Mandatory)][scriptblock] $ScriptBlock,
        [int] $Retries = 5,
        [int] $DelaySeconds = 5
    )

    for ($i = 0; $i -le $Retries; $i++) {
        try {
            & $ScriptBlock
            return
        }
        catch {
            if ($i -eq $Retries) { throw }
            Write-Warning "Attempt $i/$Retries failed: $($_.Exception.Message). Retrying in $DelaySeconds s..."
            Start-Sleep -Seconds $DelaySeconds
        }
    }
}
