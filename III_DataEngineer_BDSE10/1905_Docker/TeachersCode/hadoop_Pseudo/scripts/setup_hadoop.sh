#!/bin/bash
# assumption:
# 1. hadoop account is created
# 2. hadoop passwordless login is configured
# 3. oracle java is installed and set default
# 4. hadoop ecosystem is installed at /usr/local

hadoop_version="3.2.0"
hadoop_dir="/usr/local"
hadoop_home="${hadoop_dir}/hadoop"

# Using Oracle JDK
#java_home="/usr/lib/jvm/java-8-oracle"

# Using OpenJDK
java_home="/usr/lib/jvm/java-8-openjdk-amd64"

#extract hadoop tarball
tar -xvf /vagrant/scripts/hadoop-${hadoop_version}.tar.gz -C ${hadoop_dir}
mv ${hadoop_dir}/hadoop-${hadoop_version} ${hadoop_home}
chown -R hadoop:hadoop ${hadoop_home}

#Setup Hadoop Environment 
echo "Setup Hadoop Environment..."

cat <<EOT >> /home/hadoop/.bashrc
# Set HADOOP_HOME
export HADOOP_HOME=${hadoop_home}
# Set HADOOP_MAPRED_HOME
export HADOOP_MAPRED_HOME=${hadoop_home}
# Set JAVA_HOME 
export JAVA_HOME=${java_home}
# Add Hadoop bin and sbin directory to PATH
export PATH=\$PATH:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin
EOT

# Update hadoop-env.sh 
sed -i "/^# export JAVA_HOME=/a export JAVA_HOME=${java_home}" ${hadoop_home}/etc/hadoop/hadoop-env.sh
sed -i "/^# export HADOOP_HOME/a export HADOOP_HOME=${hadoop_home}" ${hadoop_home}/etc/hadoop/hadoop-env.sh
sed -i -r "s/^# (export HADOOP_CONF_DIR=.*)/\1/" ${hadoop_home}/etc/hadoop/hadoop-env.sh

# The maximum amount of heap to use, in MB. Default is 1000.
# sed -i '/^#export HADOOP_HEAPSIZE/ s:.*:export HADOOP_HEAPSIZE=256:' ${hadoop_home}/etc/hadoop/hadoop-env.sh


# Update Configuration Files
cp -f /vagrant/scripts/core-site.xml ${hadoop_home}/etc/hadoop

# hdfs-site.xml using default setting
cp -f /vagrant/scripts/hdfs-site.xml ${hadoop_home}/etc/hadoop

# Copy mapred-site.xml, set framework to yarn
cp -f /vagrant/scripts/mapred-site.xml ${hadoop_home}/etc/hadoop
chown hadoop:hadoop ${hadoop_home}/etc/hadoop/mapred-site.xml
chmod 644 ${hadoop_home}/etc/hadoop/mapred-site.xml

# Copy yarn-site.xml, set ResourceManager hostanme
cp -f /vagrant/scripts/yarn-site.xml ${hadoop_home}/etc/hadoop

# Copy slaves file, list all DataNode and NodeManager 
# cp -f /vagrant/scripts/workers ${hadoop_home}/etc/hadoop
