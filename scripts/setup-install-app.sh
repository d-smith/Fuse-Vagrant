#Copy a locally cached installApp distro from a shared folder, or 
#download one if not present
cd $HOME
if [ -e /vagrant/xtrac-jboss-poc-1.0.zip ]
then
	cp /vagrant/xtrac-jboss-poc-1.0.zip $HOME
else
	wget http://vc2c09dal2306.fmr.com/installApp/xtrac-jboss-poc-1.0.zip
fi

# Install ksh as the installApp scripts use the ksh
sudo apt-get install ksh

#Edit /etc/hosts and /etc/hostname to append fmr.com after the precise64
#hostname. We will also attempt to do the same thing for precise32;
#I have not tested this with precise32
sudo sed -i.bak s/precise64/'precise64.fmr.com precise64'/g /etc/hosts
sudo sed -i.bak s/precise64/precise64.fmr.com/g /etc/hostname
sudo sed -i.bak s/precise32/'precise32.fmr.com precise 32'/g /etc/hosts
sudo sed -i.bak s/precise32/precise32.fmr.com/g /etc/hostname

#Create the apps directory, make vagrant the owner, copy the distro
sudo mkdir /apps
sudo chown vagrant /apps
mv xtrac-jboss-poc-1.0.zip /apps

#Prep the installApp distro
cd /apps
unzip xtrac-jboss-poc-1.0.zip
cd fuse_esb/xtrac-jboss-poc-1.0/app-bin
cp ~/Fuse-Vagrant/installApp/master_hostmap.def.VAGRANT .
cat ~/Fuse-Vagrant/installApp/server.properties.VAGRANT >> server.properties 
cd ../installedApps/bin/
cp ~/Fuse-Vagrant/installApp/setenv .

#Run installApp.ksh
cd /apps
echo VAGRANT > envid
cd /apps/fuse_esb/xtrac-jboss-poc-1.0/app-bin
## Need to do additional configuration before installApp.ksh can be run,
## specifically creating the xtrac-repos directory and copying the custom 
## repositories under xtrac-repos, and referecing the customer repositories
## as default repos in the org ops4j pax mvn url config file.
