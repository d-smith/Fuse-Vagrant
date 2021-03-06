Fuse-Vagrant
============
Configure a vagrant ubuntu instance (the precise32 or precise64 boxes) with java, maven, fuse, etc.

To use, first edit /etc/sudoers to add the following after the env_reset line.

    Defaults  env_keep += "http_proxy"
    Defaults  env_keep += "https_proxy"

Then, do the following to prep the guest OS:

    cd $HOME
    export http_proxy="http://<proxy host>:<proxy port>"
    export https_proxy="http://<proxy host>:<proxy port>"
    sudo apt-get install -y git-core
    git clone https://github.com/d-smith/Fuse-Vagrant
    ./Fuse-Vagrant/scripts/install-prereqs.sh

Note: you can actually add a provisioning line to Vagrantfile that references the above commands in a shell script, e.g.

    config.vm.provision :shell, :path => "bootstrap.sh"
    
Where bootstrap.sh is in the same directory as Vagrantfile. Note that for apt-get to work bootstrap.sh will need to start with the following two lines:

    sudo echo 'Acquire::http::Proxy "http:///<proxy host>:<proxy port>";' > /etc/apt/apt.conf
    sudo echo 'Aquire:https:Proxy "http://<proxy host>:<proxy port>";' >> /etc/apt/apt.conf
    
Refer to [bootstrap.sh](./bootstrap.sh) for an example.


Once the guest OS is prepared, install the jboss Fuse distro via

    ./Fuse-Vagrant/scripts/setup-jboss-fuse.sh

Or install fuse using the installApp package via

    ./Fuse-Vagrant/scripts/setup-install-app.sh

Note for both the installApp and jboss installs, if you place the installApp or jboss distros in your vagrant directory, the distribution will be read via the /vagrant mount point. If not present in /vagrant, the distribution will be obtained from a local web service via wget.

When using the installApp installation, some manual reconfiguration is
needed post install to bind jetty to the localhost address such that
port mapping from the host OS to the guest OS works. To do this:

    cd /apps/fuse_esb/xtrac-jboss-poc-1.2/fmr-bin
    ./stopAll.ksh
    sed -i.bak s/default=\"precise64.yoyo.com\"//g ../installedApps/etc/jetty.xml
    cp ~/Fuse-Vagrant/optional/local-repo-sample/activemq.xml ../installedApps/etc
    ./startAll.ksh
    netstat -l -n|grep 9191

Once the above steps have been performed you should be able to bring up the
webconsole assuming you've enabled port forwarding in your vagrant
configuration.
