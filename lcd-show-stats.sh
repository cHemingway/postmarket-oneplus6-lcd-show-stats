#!/bin/bash
# Script to put key stats,including IP address, onto TTY1 = the main framebuffer
# Needs to be ran as root
set -e

# How often to sleep for
sleep_for=10

# Turn down LCD brightness
echo 512 > /sys/class/backlight/ae94000.dsi.0/brightness

# Now enter loop
while : 
do
	# From https://stackoverflow.com/a/25851186
	ip=$(ip route get 8.8.8.8 | head -1 | cut -d' ' -f8)

	# WiFi signal and rate
	# From https://unix.stackexchange.com/a/623096, modified to give rate and SSID also
	wifi_stats=$(nmcli -f IN-USE,SIGNAL,SSID,RATE dev wifi list | awk '/^\*/{if (NR!=1) {print $3,$2"%",$4"mbps"}}')

	# Battery
	battery=$(cat /sys/class/power_supply/bq27411-0/capacity)

	# Charging/Discharging/Full
	battery_status=$(cat /sys/class/power_supply/pmi8998_charger/status)

	# Print to screen
	echo "" > /dev/tty1
	echo $(uptime) > /dev/tty1
	echo $wifi_stats > /dev/tty1
	echo $ip > /dev/tty1
	echo "Battery $battery_status $battery %" > /dev/tty1

	# Sleep
	sleep $sleep_for
done
