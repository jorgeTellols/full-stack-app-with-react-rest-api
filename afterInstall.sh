#!/bin/bash
cd ~/build
sudo pm2 serve . 80
sudo save
sudo pm2 startup
cd  ~/api
sudo npm install
sudo npm run seed