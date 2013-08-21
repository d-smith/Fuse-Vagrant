# Download and unzip our Fuse distro
# Look for the installer in a shared folder with path /distros/fuse,
# download it if not found.
cd $HOME
if [ -e /distros/fuse/jboss-fuse-full-6.0.0.redhat-024.zip ]
then
	cp /distros/fuse/jboss-fuse-full-6.0.0.redhat-024.zip $HOME
else
	wget http://vc2c09dal2306.fmr.com/fuse/jboss-fuse-full-6.0.0.redhat-024.zip
fi

unzip jboss-fuse-full-6.0.0.redhat-024.zip

# Write out custom Fuse config on top of the distro's
cp Fuse-Vagrant/etc/org.ops4j.pax.url.mvn.cfg jboss-fuse-6.0.0.redhat-024/etc
cp Fuse-Vagrant/etc/users.properties jboss-fuse-6.0.0.redhat-024/etc
