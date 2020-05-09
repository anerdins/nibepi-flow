sudo sed -i 's/NODE_OPTIONS=--max_old_space_size=512/NODE_OPTIONS=--max_old_space_size=256/g' /lib/systemd/system/nodered.service
sudo systemctl daemon-reload
sudo service nodered restart
