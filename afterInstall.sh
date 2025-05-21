#!/bin/bash
cd ~/build
sudo pm2 serve . 80 --name client
sudo pm2 save
sudo pm2 startup
cd  ~/api
sudo npm install nodemon
sudo pm2 start app.js --name api
sudo pm2 save 
sudo pm2 startup