#!/bin/bash
pm2 serve . 3000 --name ./
pm2 save
pm2 startup
