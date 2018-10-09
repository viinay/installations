
#install

apt-get install mongodb-server mongodb-clients python-pymongo
# /etc/mongodb.conf

bind_ip = 10.0.0.11
smallfiles = true

service mongodb stop
rm /var/lib/mongodb/journal/prealloc.*
service mongodb start


#-----------------------------------------
#uninstall
sudo dpkg -l | grep mongo
sudo apt-get remove mongodb* --purge
