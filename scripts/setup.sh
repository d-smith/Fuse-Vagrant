#!/bin/bash
# Fuse environment setup
sudo apt-get purge openjdk*
sudo apt-get update
sudo apt-get -y install python-software-properties


sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update

sudo apt-get install debconf-utils

echo debconf shared/accepted-oracle-license-v1-1 select true | \
sudo debconf-set-selections

echo debconf shared/accepted-oracle-license-v1-1 seen true | \
sudo debconf-set-selections

sudo apt-get install -y oracle-java7-installer
sudo apt-get -y install maven

# Hmmm... sometimes unzip is not installed in the ubuntu image
sudo apt-get install unzip

# Download and unzip our Fuse distro
# Look for the installer in a shared folder with path /distros/fuse,
# download it if not found.
cd $HOME
if [ -e /distros/fuse/jboss-fuse-full-6.0.0.redhat-024.zip ]
then
	cp /distros/fuse/jboss-fuse-full-6.0.0.redhat-024.zip $HOME
else
	wget http://h.yoyo.com/fuse/jboss-fuse-full-6.0.0.redhat-024.zip
fi

unzip jboss-fuse-full-6.0.0.redhat-024.zip

# Write out custom Fuse config on top of the distro's
cp Fuse-Vagrant/etc/org.ops4j.pax.url.mvn.cfg jboss-fuse-6.0.0.redhat-024/etc
cp Fuse-Vagrant/etc/users.properties jboss-fuse-6.0.0.redhat-024/etc
