param(
  [int]$Port = 4000,
  [string]$PythonPath = ""
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path "_site")) {
  throw "_site was not found. Run scripts\jekyll-build.cmd before previewing."
}

$candidates = @()

if ($PythonPath) {
  $candidates += $PythonPath
}

if ($env:PYTHON) {
  $candidates += $env:PYTHON
}

$codexPython = Join-Path $env:USERPROFILE ".cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
$candidates += $codexPython

$pythonCommand = Get-Command python -ErrorAction SilentlyContinue
if ($pythonCommand) {
  $candidates += $pythonCommand.Source
}

$pythonLauncher = Get-Command py -ErrorAction SilentlyContinue
if ($pythonLauncher) {
  $candidates += $pythonLauncher.Source
}

$python = $candidates | Where-Object { $_ -and (Test-Path $_) } | Select-Object -First 1

if (-not $python) {
  throw "Python was not found. Pass -PythonPath or install Python."
}

Write-Host "Serving _site at http://127.0.0.1:$Port/ using $python"
& $python -m http.server $Port --bind 127.0.0.1 --directory _site
