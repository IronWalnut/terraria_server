# Server Info
**IP:** waltoncloud.ddns.net

**Port:** 7777 (default)

# Server Maintenance & Backups
The server will reboot for maintenance and to back up the world files on Mondays, Wednesdays and Fridays at 4am EST. Being logged in during this time may result in corruption of the world save!

# Installation Notes
The `run_terraria_server.sh` script includes logic to save changes and push to this repo when started and is designed to be run on server reboot. Running it requres the "screen" package `sudo apt install screen` since the server binary gets mad if you don't give it a console to get input from while it's running.

### Command Line Example:
```
# Running with backup script
sudo /opt/terraria_server/run_terraria_server.sh

# Just starting the server executable
sudo /opt/terraria_server/TerrariaServer -config /opt/terraria_server/serverconfig.txt
```

### Cronjob Example (running as sudo):
```
@reboot /opt/terraria_server/run_terraria_server.sh > /opt/terraria_server/server_console.log
```