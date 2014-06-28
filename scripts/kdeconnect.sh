#! /bin/bash
#TITLE: Setup KDEconnect 
#DEFINE: This will setup KDEconnect on your pc to allow your android phone to connect to you desktop.
#TYPE:run-root
# Install kdeconnect
sudo apt-get install kdeconnect --assume-yes;
# set kde services to run on startup and launch them now < second part dont work yet
echo "Checking if config has been modified yet...";
if more /etc/skel/.profile | grep kdeconnect; then
	echo 'NOPE';
else
	echo "xfconf-query -c xfce4-session -p /compat/LaunchKDE -s true" >> /etc/skel/.profile;
fi
for dir in /home/*; do
	rm -fv $dir/.profile;
	cp -fv /etc/skel/.profile $dir;
done
echo "Setting up firewall rules...";
# allow kdeconnect ports to work on the lan
ufw allow proto tcp from 192.168.2.0/24 to any port 1714:1764;
ufw allow proto udp from 192.168.2.0/24 to any port 1714:1764;
# set kdeconnect to load for each user when they login
echo "Checking for login script...";
if more /etc/mdm/PostLogin/Default | grep kdeconnect; then
	echo 'Nothing needs done...';
else
	echo "Adding launch command when user logs into the sytem...";
	echo "qdbus org.kde.kded /kded loadModule kdeconnect" >> /etc/mdm/PostLogin/Default;
fi
echo 'You should reboot the system to get stuff working.';
