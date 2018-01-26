#!/bin/bash
sudo echo 'Acquire::http::Proxy "http://proxyhost:port";' > /etc/apt/apt.conf
sudo echo 'Aquire:https:Proxy "http://proxyhost:port";' >> /etc/apt/apt.conf
#Need sudoers entries for add of repo for oracle jdk
echo 'Defaults  env_keep += "http_proxy"' >> /etc/sudoers
echo 'Defaults  env_keep += "https_proxy"' >> /etc/sudoers
sudo apt-get install -y git-core
export http_proxy="http://proxyhost:port"
export https_proxy="http://proxyhost:port"
git clone https://github.com/d-smith/Fuse-Vagrant
./Fuse-Vagrant/scripts/install-prereqs.sh
git clone https://github.com/d-smith/son-of-dotfiles
cd ~vagrant
ln -sb son-of-dotfiles/.vimrc .
mv .bashrc .bashrc.bak
ln -sb son-of-dotfiles/.bashrc .
echo 'done'

