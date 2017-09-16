#!/bin/bash

set -eu

##############################################
# Tor-Hardened Cleaner & Startup Script #
##############################################

if [ $UID -ne 0 ];then
	echo "Tor should be initiated as root in this script. Quit..."
	exit 1
fi

# Check whether tor is already running.
ISRUN=$(ps -ef |grep "/usr/bin/tor" |grep -v grep | awk '{print $8}' | sed -n '1 p')
if [ "$ISRUN" = "/usr/bin/tor" ];then
	echo "Is Tor already running? Please quit it first."
	exit 1
fi

# Start our iptables rules.
echo "Changing iptables rules to enable transparent proxy...Please enter root password: "
iptables-restore < /opt/tor-hardened/iptables-tor.rules

# Start Tor with our hardened torrc.
echo "Running Tor..."
/usr/bin/tor -f /opt/tor-hardened/torrc

exit

