/*
	MongoDB is already included in ubuntu package repository
	ubuntu ensures the authenticity of software packages by verifyting that they are signed with GPG keys,so we first have to import that key from the official MongoDB repository
*/

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

/*
	Add MongoDB repository details so `apt` will know where to download the packages from
*/

echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list


/*
	update the packages list
*/

sudo apt-get update

/*
	install MongoDB package itself
*/

sudo apt-get install -y mongodb-org

/*
	create a unit file to manage the MongoDB service
	A unit file tells systemd how to manage a resource
	Most common unit type is a service,which determines how to start or stop the service,whether should it be automatically started at boot,and whether it is dependent on other software to run
*/

sudo nano /etc/systemd/system/mongodb.service

  `
  		[Unit]
  		Description=High-performance, schema-free document-oriented database
  		After=network.target

  		[Service]
  		User=mongodb
  		ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

  		[Install]
  		WantedBy=multi-user.target
  `
/*
	The Unit section contains the overview as well as dependencies that must be satisfied before the service is started.In Our case,MongoDB depends on networking already being available,hence network.target here

	The Service section how the service should be started.The User directive specifies that the server will be run under the mongodb user,and the ExecStart directive defines the startup command for MongoDB server

	The Install tells systemd when the service should be automatically started.The multi-user.target is  a standard system startup sequence,which means the server will be automatically started during boot.
*/

/*
	start the newly created service
*/

sudo systemctl start mongodb
sudo systemctl status mongodb

/*
	last step is to enable automatically starting MongoDB when the system starts
*/

sudo systemctl enable mongodb

/*
	Adjusting the firewall check https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04
*/