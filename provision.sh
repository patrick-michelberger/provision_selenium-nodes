#!/bin/bash

sudo echo "Europe/Berlin" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo apt-get update -y
sudo apt-get install -y language-pack-de
sudo apt-get install -y ntp

PUBLIC_IP=$(wget http://ipecho.net/plain -O - -q)

sudo docker run -d -p 5555:5555 -e REMOTE_HOST="http://$PUBLIC_IP:5555" -e HUB_PORT_4444_TCP_ADDR="54.93.112.191" -e HUB_PORT_4444_TCP_PORT="4444" --name "chrome-node" oldjoe/node-chrome