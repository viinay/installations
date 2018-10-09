#!/bin/bash
sudo apt-get update
sudo apt-get install build-essential libssl-dev -y
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.profile
nvm install stable
nvm use stable
nvm install 7.4.0
nvm use 7.4.0
nvm use 7.4.0
node -v
nvm run 7.4.0 -v
nvm alias default 7.4.0

#npm install --save tcp-ping request express
#npm install -g pm2


#install npm with nvm
sudo npm install -g npm@X.X.X
