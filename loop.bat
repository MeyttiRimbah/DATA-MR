@echo off
echo RDP by ExynosAdmin
tasklist | find /i "ngrok.exe" >Nul && goto check || echo "Unable to get the NGROK tunnel, make sure the NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM is still running: https://dashboard.ngrok.com/status/tunnels" & ping 127.0.0.1 >Nul
:check
ping 127.0.0.1 > nul
cls
echo RDP by ExynosAdmin

goto check
