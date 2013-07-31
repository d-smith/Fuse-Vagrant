Fuse-Vagrant
============
Configure a vagrant ubuntu instance (obtainerd via precise32) with java, maven, fuse, etc.

To use, first edit /etc/sudoers to add 

    Defaults  env_keep += "http_proxy"
    Defaults  env_keep += "https_proxy"

lines after the Defaults env_reset line

    cd $HOME
    sudo apt-get install -y git-core
    git clone https://github.com/d-smith/Fuse-Vagrant
    ./setup/setup.sh
