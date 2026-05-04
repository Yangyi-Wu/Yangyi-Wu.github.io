param(
  [string]$RubyRoot = "$env:LOCALAPPDATA\Ruby32-x64"
)

$ErrorActionPreference = "Stop"

$rubyBin = Join-Path $RubyRoot "bin"
$rubyExe = Join-Path $rubyBin "ruby.exe"

if (-not (Test-Path $rubyExe)) {
  throw "Ruby was not found at $rubyExe. Install Ruby+Devkit first, or pass -RubyRoot."
}

$env:PATH = "$rubyBin;$env:PATH"
$bundlePath = Join-Path $RubyRoot "bundle\Yangyi-Wu.github.io"
$env:BUNDLE_PATH = $bundlePath

bundle install
bundle exec jekyll build
