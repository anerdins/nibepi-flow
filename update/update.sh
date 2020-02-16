echo "Looking for Node-RED folder."
dirNode=$(find / -type f -name 'flows.json' 2>/dev/null | sed -r 's|/[^/]+$||' |sort |uniq)
if [[ ($dirNode != "") ]]
then
echo "Path found: ${dirNode}"
echo "Stopping Node-RED..."
sudo service nodered stop
mount=$(sudo mount -o remount,rw / 2>/tmp/tar_stderr);
echo "Installing the NibePi addon to Node-RED"
cd $dirNode && npm uninstall node-red-contrib-nibepi && npm install --save anerdins/node-red-contrib-nibepi#master
echo "Downloading new flows for Node-RED"
cd /tmp && wget https://raw.githubusercontent.com/anerdins/nibepi-flow/master/flows.json
cd /tmp && mv -f flows.json $dirNode/flows.json
echo "Updated succesfully"
echo "Restarting Node-RED."
sudo service nodered restart
fi
