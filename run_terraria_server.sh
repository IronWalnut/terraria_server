#!/bin/bash

##################################################################
# Notes: This script is run as sudo by crontab on server reboot. #
# It will push a backup the world, then start the server.        #
# All directory references are relative to TERRARIA_SERVER_DIR.  #
##################################################################
TERRARIA_SERVER_DIR='/opt/terraria_server'

######## Wait for networking stuff to come online ########
sleep 60

######## Run Server GitHub Backup ########
# Create commit on all files with timestamp as message
CURRENT_TIME=$(date "+%Y.%m.%d-%H.%M.%S")
cd $TERRARIA_SERVER_DIR && sudo git add -A && sudo git commit -a -m "$CURRENT_TIME"

# Push to GitHub using SSH (as root)
cd $TERRARIA_SERVER_DIR && sudo git push origin master -v

######## Start Minecraft Bedrock Server ########
cd $TERRARIA_SERVER_DIR && sudo ./TerrariaServer -config /opt/terraria_server/serverconfig.txt