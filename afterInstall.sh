#!/bin/bash
cd ~/build
sudo pm2 serve . 80 --name client
sudo pm2 save
sudo pm2 startup
cd  ~/api
sudo npm install
sudo pm2 start npm --name api -- run start
sudo pm2 save 
sudo pm2 startup
# sudo dnf update -y
# sudo dnf install mariadb105 -y
# mysql --version