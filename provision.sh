#!/bin/bash

sudo echo "Europe/Berlin" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo apt-get update -y
sudo apt-get install -y language-pack-de

PUBLIC_IP=$(wget http://ipecho.net/plain -O - -q)

array=( 1 2 3 4 )
for i in "${array[@]}"
do
	sudo docker run -d -p 5555:5555 -e REMOTE_HOST="http://$PUBLIC_IP:5555" -e HUB_PORT_4444_TCP_ADDR="54.93.73.118" -e HUB_PORT_4444_TCP_PORT="4444" --name "chrome-node-$i" selenium/node-chrome:2.47.1
done

