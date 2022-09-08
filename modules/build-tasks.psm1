function Get-SettingsJson($Settings) {
    $deploySettings = @{}
    foreach ($p in $Settings.GetEnumerator()) {
        $deploySettings.Add($p.Name, @{ value = $p.Value })
    }
    $json = New-Object psobject -Property $deploySettings | ConvertTo-Json -Compress
    return $json -replace '"', '\"'
}

function Exec($Command) {
    $Command = [scriptblock]::Create($Command)
    Write-Host "[$Command]" -ForegroundColor DarkGray
    Invoke-Command -ScriptBlock $Command
    Write-Host
    if ($LASTEXITCODE -ne 0) {
        Fail 'Something bad happened'
    }
}

function Fail($Message) {
    Write-Error $Message
    exit -1
}
