#!/bin/bash

sudo yum install nodejs20-npm -y
sudo npm install -g npm@11.3.0
sudo npm install -g pm2
sudo npm install -g serve
cd /home/ec2-user/

# Detener procesos anteriores si existen
pm2 delete all || true

# Frontend
cd frontend
pm2 serve . 3000 --name ./

pm2 save
pm2 startup
