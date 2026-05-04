@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0preview-static.ps1" %*
