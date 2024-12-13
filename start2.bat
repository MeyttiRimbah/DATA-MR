@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s http://localhost:4040/api/tunnels/ | jq ".tunnels[0].public_url" || echo "Failed to retreive NGROK authtoken - check again your authtoken"
ping -n 10 127.0.0.1 >nul
