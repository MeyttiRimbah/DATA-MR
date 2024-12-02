@echo off
setlocal enabledelayedexpansion

:: Display message
echo IP:

:: Check if ngrok.exe is running
tasklist | find /i "ngrok.exe" >nul
if errorlevel 1 (
    echo "Ngrok is not running or not found."
    exit /b
)

:: Fetch the public URL from the Ngrok API
curl -s http://localhost:4040/api/tunnels/ > ngrok_response.json

:: Parse the public URL from the JSON response
set public_url=
for /f "tokens=2 delims=:," %%A in ('findstr /i "public_url" ngrok_response.json') do (
    set temp_url=%%A
    set temp_url=!temp_url:"=!
    set public_url=!temp_url!
)

:: Clean up temporary file
del ngrok_response.json

:: Check if the public URL is retrieved
if "!public_url!"=="" (
    echo "Failed to retrieve the Ngrok endpoint - check again your Ngrok configuration."
) else (
    echo tcp://!public_url!
)
