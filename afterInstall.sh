#!/bin/bash
cd ~/build
sudo pm2 serve . 80
pm2 save
sudo pm2 startup
cd  ~/api
npm i
npm run seed
npm run start