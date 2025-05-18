#!/bin/bash
cd ~/build
sudo pm2 serve . 80 --name clientsudo save
sudo pm2 startup
cd  ~/api
sudo npm install
# sudo npm run seed
sudo pm2 start npm --name "api" -- run start
sudo pm2 save 
sudo pm2 startup
#!/bin/bash
sudo dnf update -y
sudo dnf install mariadb105 -y
mysql --version