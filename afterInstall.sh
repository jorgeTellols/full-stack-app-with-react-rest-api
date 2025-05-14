#!/bin/bash
cd ~/build
sudo pm2 serve . 80
pm2 save
sudo pm2 startup
# cd  ~/api
# sudo npm install
# npm run seed
# sudo pm2 serve . 5000
# pm2 save
# sudo pm2 startup