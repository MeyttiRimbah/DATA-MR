@echo off
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s http://localhost:4040/api/tunnels/ | jq ".tunnels[0].public_url" || echo "Failed to retreive NGROK authtoken - check again your authtoken"
