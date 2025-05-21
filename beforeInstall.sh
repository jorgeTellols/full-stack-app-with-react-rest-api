#!/bin/bash
sudo npm install -g npm@11.3.0
sudo npm install -g pm2
sudo npm install -g serve
sudo pm2 delete all || true