#!/bin/bash
pm2 serve . 3000 --name ./
pm2 save
sudo pm2 startup
