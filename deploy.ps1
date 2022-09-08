param(
    [ValidateSet('Dev', 'Prod')][string]$Environment = 'Dev'
)

$ErrorActionPreference = 'Stop'
Import-Module "$PSScriptRoot\modules\build-tasks.psm1" -Force

$settings = @{
    Dev = @{
        storageName = 'someexample4711dev'
        rgName      = 'some-lab-dev'
    }
    Prod = @{
        storageName = 'someexample4711prod'
        rgName      = 'some-lab-prod'
    }
}.$Environment

$main = Resolve-Path "$PSScriptRoot\infrastructure\main.bicep"
$parameters = Get-SettingsJson $settings
Exec "az deployment sub create -n my-deployment -l westeurope -f $main -p '$parameters'"
