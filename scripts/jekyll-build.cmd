@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0jekyll-build.ps1" %*
