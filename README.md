Fuse-Vagrant
============
Configure a vagrant ubuntu instance (the precise32 or precise64 boxes) with java, maven, fuse, etc.

To use, first edit /etc/sudoers to add the following after the env_reset line.

    Defaults  env_keep += "http_proxy"
    Defaults  env_keep += "https_proxy"

Then, do the following to prep the guest OS:

    cd $HOME
    export http_proxy="http://http.proxy.fmr.com:8000"
    export https_proxy="http://http.proxy.fmr.com:8000"
    sudo apt-get install -y git-core
    git clone https://github.com/d-smith/Fuse-Vagrant
    ./Fuse-Vagrant/scripts/install-prereqs.sh

Once the guest OS is prepared, install the jboss Fuse distro via

    ./Fuse-Vagrant/scripts/setup-jboss-fuse.sh

Or install fuse using the installApp package via

    ./Fuse-Vagrant/scripts/setup-install-app.sh
