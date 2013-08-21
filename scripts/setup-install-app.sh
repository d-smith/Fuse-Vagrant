#Copy a locally cached installApp distro from a shared folder, or 
#download one if not present
cd $HOME
if [ -e /distros/fuse/xtrac-jboss-1.0.5.2.zip ]
then
	cp /distros/fuse/xtrac-jboss-1.0.5.2.zip $HOME
else
	wget http://vc2c09dal2306.fmr.com/installApp/xtrac-jboss-1.0.5.2.zip
fi

# Install ksh as the installApp scripts use the ksh
sudo apt-get install ksh

#Edit /etc/hosts and /etc/hostname to append fmr.com after the precise64
#hostname. We will also attempt to do the same thing for precise32;
#I have not tested this with precise32
sudo sed -i.bak s/precise64/precise64.fmr.com/g /etc/hosts
sudo sed -i.bak s/precise64/precise64.fmr.com/g /etc/hostname
sudo sed -i.bak s/precise32/precise32.fmr.com/g /etc/hosts
sudo sed -i.bak s/precise32/precise32.fmr.com/g /etc/hostname

#Create the apps directory, make vagrant the owner, copy the distro
sudo mkdir /apps
sudo chown vagrant /apps
cp xtrac-jboss-1.0.5.2.zip /apps

#Prep the installApp distro
cd /apps
unzip xtrac-jboss-1.0.5.2.zip
cd fuse_esb/xtrac-jboss-1.0.5.2/app-bin
cp ~/Fuse-Vagrant/installApp/master_hostmap.def.VAGRANT .
cat ~/Fuse-Vagrant/installApp/server.properties.VAGRANT >> server.properties 
cd ../installedApps/bin/
cp ~/Fuse-Vagrant/installApp/setenv .

#Run installApp.ksh
cd /apps/fuse_esb/xtrac-jboss-1.0.5.2/app-bin
./installApp.ksh
