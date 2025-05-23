#!/bin/bash
sudo yum update -y
sudo yum install -y nginx nodejs20-npm
sudo npm install -g npm@11.3.0
sudo npm install -g pm2
sudo pm2 delete all || true