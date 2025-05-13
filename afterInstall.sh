#!/bin/bash
pm2 serve . 3000 --name ./build
pm2 save
sudo pm2 startup
# cd  ~/api
# npm run start