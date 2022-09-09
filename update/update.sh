echo "Setting up Node-RED folder."
dirNode="/home/pi/.node-red"
if [[ ($dirNode != "") ]]
then
echo "Path: ${dirNode}"
echo "Stopping Node-RED..."
sudo service nodered stop
echo "Setting RW mode on filesystem"
mount=$(sudo mount -o remount,rw / 2>/tmp/tar_stderr);
echo "Installing the NibePi addon to Node-RED"
cd /tmp && git clone https://github.com/anerdins/nibepi-flow/ && cd nibepi-flow/ && git checkout 1.2 && cp -r flows.json /home/pi/.node-red/flows.json && cp -r package.json /home/pi/.node-red && cd .. && sudo rm -R nibepi-flow/

cd /tmp && git clone https://github.com/anerdins/nibepi/ && cd nibepi/ && git checkout 1.2 && sudo rm -R /home/pi/.node-red/node_modules/nibepi/* && cp -r * /home/pi/.node-red/node_modules/nibepi/ && cd .. && sudo rm -R nibepi

cd /tmp && git clone https://github.com/anerdins/node-red-contrib-nibepi.git && cd node-red-contrib-nibepi/ && git checkout 1.2 && sudo rm -R /home/pi/.node-red/node_modules/node-red-contrib-nibepi/* && cp -r * /home/pi/.node-red/node_modules/node-red-contrib-nibepi/ && cd .. && sudo rm -R node-red-contrib-nibepi/

echo "Updated succesfully"
echo "Starting Node-RED."
sudo service nodered start
fi
