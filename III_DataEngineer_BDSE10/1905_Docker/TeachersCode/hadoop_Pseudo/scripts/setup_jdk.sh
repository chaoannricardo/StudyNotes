#!/bin/bash

echo "Install essential packages..."

apt install -y dkms
apt install -y build-essential
apt install -y linux-headers-generic 

apt install -y bash-completion
apt install -y curl tar 
apt install -y software-properties-common

echo "Install JDK..."

# Install oracle java
#echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections 
#add-apt-repository -y ppa:webupd8team/java 
#apt update 
#apt install -y oracle-java8-set-default

# Install OpenJDK
apt install -y openjdk-8-jdk

