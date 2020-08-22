#!/bin/bash

##################################################################
# Notes: This script is run as sudo by crontab on server reboot. #
# It will push a backup the world, then start the server.        #
# All directory references are relative to TERRARIA_SERVER_DIR.  #
##################################################################
TERRARIA_SERVER_DIR='/opt/terraria_server'
cd $TERRARIA_SERVER_DIR

######## Wait for networking stuff to come online ########
sleep 90

######## Run Server GitHub Backup ########
# Create commit on all files with timestamp as message
CURRENT_TIME=$(date "+%Y.%m.%d-%H.%M.%S")
sudo git add -A && sudo git commit -a -m "$CURRENT_TIME"

# Push to GitHub using SSH (as root)
sudo git push origin master -v

######## Start Minecraft Bedrock Server ########
sudo /usr/bin/screen -dmS terraria_server /bin/bash -c "$TERRARIA_SERVER_DIR/TerrariaServer.bin.x86_64 -config $TERRARIA_SERVER_DIR/serverconfig.txt >> $TERRARIA_SERVER_DIR/server_console.log"
