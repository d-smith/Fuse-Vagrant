Fuse-Vagrant
============
Configure a vagrant ubuntu instance (obtainerd via precise32) with java, maven, fuse, etc.

To use, first edit /etc/sudoers to add the following after the env_reset line.

    Defaults  env_keep += "http_proxy"
    Defaults  env_keep += "https_proxy"

Then, do the following:

    cd $HOME
    sudo apt-get install -y git-core
    git clone https://github.com/d-smith/Fuse-Vagrant
    ./setup/setup.sh
