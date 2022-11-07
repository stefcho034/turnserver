#!/bin/sh
echo "Updating packages ..."

sudo apt-get -y update

echo "Installing coturn ..."

sudo apt-get -y install coturn

echo "Stopping coturn ..."

sudo systemctl stop coturn

echo "Enable Coturn"

sudo /bin/sh -c 'echo "TURNSERVER_ENABLED=1" >> /etc/default/coturn'

echo "Edit turnserver.config file"

sudo /bin/sh -c 'echo "listening-port=3478" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "tls-listening-port=5349" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "fingerprint" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "lt-cred-mech" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "server-name=ksimconnect.com" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "realm=ksimconnect.com" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "user=guest:somepassword" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "total-quota=100" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "stale-nonce=600" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "cert=/etc/letsencrypt/live/ksimconnect.com/fullchain.pem" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "pkey=/etc/letsencrypt/live/ksimconnect.com/privkey.pem" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "cipher-list="\"ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384\" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "proc-user=turnserver" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "proc-group=turnserver" >> /etc/turnserver.conf'



sudo systemctl start coturn

sudo systemctl status coturn

