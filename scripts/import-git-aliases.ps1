Param(
    [switch]$Quiet
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Info([string]$msg) {
    if (-not $Quiet) { Write-Host $msg }
}

# Resolve paths
$ConfigDir = Join-Path $HOME ".config/git"
$Target = Join-Path $ConfigDir "aliases.gitconfig"
$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Source = Join-Path $RepoRoot "git/aliases.gitconfig"

if (-not (Test-Path $Source)) {
    throw "Cannot find git/aliases.gitconfig next to this script."
}

if (-not (Test-Path $ConfigDir)) { New-Item -ItemType Directory -Force -Path $ConfigDir | Out-Null }

Copy-Item -LiteralPath $Source -Destination $Target -Force
Write-Info "Copied aliases to $Target"

# Add include.path if not already present
$existing = git config --global --get-all include.path 2>$null
if (-not ($existing -match [regex]::Escape($Target))) {
    git config --global --add include.path $Target
    Write-Info "Added include.path to global config"
} else {
    Write-Info "Include already present in global config"
}

Write-Info "Done. Try: git brlast"


