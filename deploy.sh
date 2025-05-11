#!/bin/bash

cd /home/ec2-user/app

# Detener procesos anteriores si existen
pm2 delete all || true

# Backend
cd api
npm install
npm run seed
pm2 start npm --name backend -- start
cd ..

# Frontend
cd frontend
npm install -g serve
pm2 serve . 3000 --name frontend

pm2 save
pm2 startup
