#!/bin/bash
# Fuse environment setup
export http_proxy="http://http.proxy.fmr.com:8000"
export https_proxy="http://http.proxy.fmr.com:8000"
sudo apt-get purge openjdk*
sudo apt-get update
sudo apt-get -y install python-software-properties


sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer
sudo apt-get -y install maven

