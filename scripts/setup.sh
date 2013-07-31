#!/bin/bash
# Fuse environment setup
sudo apt-get purge openjdk*
sudo apt-get update
sudo apt-get -y install python-software-properties


sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer
sudo apt-get -y install maven

