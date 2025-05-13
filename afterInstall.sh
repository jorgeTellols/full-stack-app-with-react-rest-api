#!/bin/bash
cd ~/build
pm2 serve . 3000
pm2 save
sudo pm2 startup
# cd  ~/api
# npm run start