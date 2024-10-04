#!/bin/bash

# Script Definition
logpath=/var/log/deployment_script_log

# Upgrading Linux Distribution
echo "#############################" >> $logpath
echo "Upgrading Linux Distribution" >> $logpath
echo "#############################" >> $logpath
sudo apt-get update >> $logpath
sudo apt-get -y upgrade && sudo apt-get install traceroute >> $logpath
echo " " >> $logpath