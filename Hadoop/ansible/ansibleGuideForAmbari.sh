# ansible Guide for Hadoop

# make directory for playbooks storage; 
sudo mkdir /etc/ansible/yml # the place to store playbook.
sudo chown -R student:student /etc/ansible/

# how to run ===============================================
ansible test -a "touch /home/student/lalala" # ansible <group> -a <remote command>
ansible-playbook /etc/ansible/yml/Got.yml # ansible-playbook <playbook-path>
ansible hadoop -m shell -a 'free -hm' # ansible <group> shell(shell command) -> to view free memory within each cluster 

# install Maven ===========================================

# configure playbook variable
sudo nano /etc/ansible/roles/vars/main.yml
# --------------- NEW
---
dir = /opt/modules
# --------------

# install Maven
sudo nano /etc/ansible/yml/installMaven.yml
# --------------- NEW
---
- name: install maven
  hosts: hadoop
  remote_user: student
  become: yes
  become_method: sudo
  become_user: root

  tasks:
   - name: set variables
     set_fact: dir="/opt/modules"
   - name: rm
     file: path=/opt/modules/maven state=absent
   - name: untar
     unarchive:
      src=/opt/softwares/apache-maven-3.6.1-bin.tar.gz
      dest={{dir}}
   - name: mv dirctory
     shell: mv /opt/modules/apache-maven-3.6.1 /opt/modules/maven
   - name: add environment variable
     shell: echo "# MAVEN_HOME" >> /etc/profile;echo "export MAVEN_HOME=/opt/modules/maven" >> /etc/profile;echo "export MAVEN=$MAVEN_HOME/bin" >> /etc/profile;echo "export PATH=$MAVEN:$PATH" >> /etc/profile;
   - name: change maven owner and group
     shell: chown -R student:student {{dir}}/maven
# --------------
ansible-playbook /etc/ansible/yml/installMaven.yaml

# check maven version
mvn -version


# install Ambari ===========================================

# install Ambari1
sudo nano /etc/ansible/yml/installAmbari1.yml
# --------------- NEW
---
- name: install Ambari I
  hosts: hadoop
  remote_user: student
  become: yes
  become_method: sudo
  become_user: root

  tasks:
   - name: set variables
     set_fact: dir="/opt/modules"
   - name: untar Ambari
     unarchive:
      src=/opt/softwares/apache-ambari-2.7.3-src.tar.gz
      dest={{dir}}
   - name: mv dirctory Ambari
     shell: mv /opt/modules/apache-ambari-2.7.3-src /opt/modules/ambari
   - name: change ambari owner and group
     shell: chown -R student:student {{dir}}/ambari
   - name: untar HDP
     unarchive:
      src=/opt/softwares/HDP-3.1.0.0-ubuntu16-deb.tar.gz
      dest={{dir}}
   - name: change HDP owner and group
     shell: chown -R student:student {{dir}}/HDP
   - name: untar HDP-UTILS
     unarchive:
      src=/opt/softwares/HDP-UTILS-1.1.0.22-ubuntu16.tar.gz
      dest={{dir}}
   - name: change HDP-UTILS owner and group
     shell: chown -R student:student {{dir}}/HDP-UTILS
   - name: install apache2
     shell: apt-get update;apt-get install apache2 -y;mkdir -p /var/www/html
   - name: copy modules into /var/www/html
     shell: cd /var/www/html;sudo cp -r /opt/modules/HDP .;sudo cp -r /opt/modules/HDP-UTILS .;sudo cp -r /opt/modules/ambari .;chown -R student:student /var/www/html

# --------------
ansible-playbook /etc/ansible/yml/installAmbari1.yml


# Set & Compile Version
cd /var/www/html/ambari
mvn versions:set -DnewVersion=2.7.3.0.0


# install Ambari2
sudo nano /etc/ansible/yml/installAmbari2.yml
# --------------- NEW
---
- name: install Ambari II
  hosts: hadoop
  remote_user: student
  become: yes
  become_method: sudo
  become_user: root
  
  tasks:
   - name: Add Ambari repository
     shell: cd /etc/apt/sources.list.d;wget http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.7.3.0/ambari.list;apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
   - name: install ambari-server, ambari-agent
     shell: apt-get update;apt-get install ambari-server -y --allow-unauthenticated;apt-get install ambari-agent -y --allow-unauthenticated;apt-get install ambari-metrics-assembly -y --allow-unauthenticated
# --------------
ansible-playbook /etc/ansible/yml/installAmbari2.yml

# Check ambari.sh for further information of next step.



