#!/bin/bash
cd build
pm2 serve . 80
pm2 save
sudo pm2 startup
# cd  ~/api
# npm run start