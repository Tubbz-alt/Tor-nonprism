#!/bin/sh

##############################################
# Tor-Hardened Cleaner & Startup Script #
##############################################
# Clean left over files
echo "Cleaning any files left over from a previous run..."
rm /opt/torchroot/var/lib/tor/*
# Detect old version and upgrade
Torchroothash=$(sha256sum /opt/torchroot/usr/bin/tor | awk '{print $1}')
Toroutsidehash=$(sha256sum /usr/bin/tor | awk '{print $1}')
if [ "$Torchroothash" != "$Toroutsidehash" ]
then
	echo "New version of Tor detected! Updating chroot before running."
	rm -rf /opt/torchroot
	wait
	/usr/bin/sh -c "/opt/tor-hardened-scripts/torchroot.sh"
	wait
fi

# Start Tor inside of our chroot
echo "Running Tor..."
chroot --userspec=tor:tor /opt/torchroot /usr/bin/tor -f /etc/tor/torrc