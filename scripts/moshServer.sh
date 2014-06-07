#! /bin/bash
#TITLE: Install MOSH Server
#DEFINE: This program installs and configures the firewall to allow mosh server to work properly.
#DEFINE: This means that external computers will be able to access this computer via mosh.
sudo apt-get install mosh --assume-yes
# by default allow enough ports for 100 simultanious connections
sudo ufw allow 60000:60100/udp

