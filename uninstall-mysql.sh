sudo -i
service mysql stop
killall -KILL mysql mysqld_safe mysqld
apt-get --yes purge mysql-server mysql-client
apt-get --yes autoremove --purge
apt-get autoclean
deluser --remove-home mysql
delgroup mysql
rm -rf /etc/apparmor.d/abstractions/mysql /etc/apparmor.d/cache/usr.sbin.mysqld /etc/mysql /var/lib/mysql /var/log/mysql* /var/log/upstart/mysql.log* /var/run/mysqld
updatedb
exit

#If you want to delete the log of what you did while using the mysql client:

rm ~/.mysql_history

#If you want to delete the logs of what all users on the system did while using the mysql client (the other users might be unhappy with this):

awk -F : '{ print($6 "/.mysql_history"); }' /etc/passwd | xargs -r -d '\n' -- sudo rm -f --


#or for all logs including those outside of existing user home directories:

sudo find / -name .mysql_history -delete

