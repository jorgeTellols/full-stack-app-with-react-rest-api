#!/bin/bash
sudo mkdir -p /var/www/frontend
sudo cp -r ~/build/* /var/www/frontend/
sudo cp ~/proyecto-final.conf /etc/nginx/conf.d/proyecto-final.conf
sudo systemctl enable nginx
sudo systemctl restart nginx
cd ~/api
sudo npm install
sudo pm2 start app.js --name api
sudo pm2 save 
sudo pm2 startup