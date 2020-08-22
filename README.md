# Server Info

### IP: waltoncloud.ddns.net
### Port: 7777

# Server Maintenance & Backups
The server will reboot for maintenance and to back up the world files nightly at 4am EST.

<span style="color:red">**WARNING:**</span> Being logged in during this time may result in corruption of the world save!

## Cronjob Example:
```
@reboot /usr/bin/screen -dmS terraria_server /bin/bash -c "/opt/terraria_server/run_terraria_server.sh > /opt/terraria_server/server_console.log"
```