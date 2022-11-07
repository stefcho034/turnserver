#!/bin/sh
echo "Updating packages ..."

sudo apt-get -y update

echo "Installing coturn ..."

sudo apt-get -y install coturn

echo "Stopping coturn ..."

sudo systemctl stop coturn

echo "Copying the config files"

sudo cp PostDeploy/turnserver.conf /etc/turnserver.conf
sudo cp PostDeploy/coturn /etc/default/coturn
