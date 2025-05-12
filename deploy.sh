#!/bin/bash

cd /home/ec2-user/app

# Detener procesos anteriores si existen
pm2 delete all || true

# Frontend
cd frontend
npm install -g serve
pm2 serve . 3000 --name frontend

pm2 save
pm2 startup
