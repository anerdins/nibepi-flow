echo "Looking for Node-RED folder."
dirNode=$(find / -type f -name 'flows.json' 2>/dev/null | sed -r 's|/[^/]+$||' |sort |uniq)
if [[ ($dirNode != "") ]]
then
echo "Path found: ${dirNode}"
echo "Stopping Node-RED..."
sudo service nodered stop
mount=$(sudo mount -o remount,rw / 2>/tmp/tar_stderr);
echo "Installing the NibePi addon to Node-RED"
cd $dirNode && npm uninstall node-red-contrib-nibepi && npm install --save anerdins/node-red-contrib-nibepi#1.2
echo "Downloading new flows for Node-RED"
mount=$(sudo mount -o remount,rw / 2>/tmp/tar_stderr);
cd /tmp && wget https://raw.githubusercontent.com/anerdins/nibepi-flow/1.2/flows.json && wget https://raw.githubusercontent.com/anerdins/nibepi-flow/1.2/package.json
cd /tmp && mv -f flows.json $dirNode/flows.json && mv -f package.json $dirNode/package.json
echo "Updated succesfully"
echo "Starting Node-RED."
sudo service nodered start
fi
