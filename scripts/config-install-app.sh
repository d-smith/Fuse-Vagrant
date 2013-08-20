#!/bin/bash
cd /apps
rm -rf fuse_esb
rm -rf log
unzip xtrac-jboss-1.0.5.2.zip
cd fuse_esb/xtrac-jboss-1.0.5.2/app-bin
cp ~/Fuse-Vagrant/installApp/master_hostmap.def.VAGRANT .
cat ~/Fuse-Vagrant/installApp/server.properties.VAGRANT >> server.properties 
cd ../installedApps/bin/
cp ~/Fuse-Vagrant/installApp/setenv .

