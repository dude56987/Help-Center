#! /bin/bash
#TITLE: Setup Ristretto Image Viewer
#DEFINE: This will install Ristretto and set it as the new default image viewer on the system.
# install ristretto
sudo apt-get install ristretto --assume-yes
# replace default image viewer via default mimetypes file with a sed replace command
sudo sed -i.bak "s/fehOpen/ristretto/g" /usr/share/applications/defaults.list
