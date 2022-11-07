#!/bin/sh
echo "Updating packages ..."

sudo apt-get -y update

echo "Installing coturn ..."

sudo apt-get -y install coturn

echo "Stopping coturn ..."

sudo systemctl stop coturn
