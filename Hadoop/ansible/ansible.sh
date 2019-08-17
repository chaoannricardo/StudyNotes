# ansible

# install ansible controller ====================================
# (https://www.ansible.com/resources/videos/quick-start-video)
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
# ansible configuration files: /etc/ansible

# install ssh with ansible =======================================
sudo nano /etc/ansible/hosts
# --------------- ADD
[hadoop]
cluster01 ansible_ssh_host=192.168.35.85
cluster02 ansible_ssh_host=192.168.35.89
cluster03 ansible_ssh_host=192.168.35.90
cluster04 ansible_ssh_host=192.168.35.92
cluster05 ansible_ssh_host=192.168.35.93
cluster06 ansible_ssh_host=192.168.35.94
cluster07 ansible_ssh_host=192.168.35.141
cluster08 ansible_ssh_host=192.168.35.142
cluster09 ansible_ssh_host=192.168.35.146
cluster10 ansible_ssh_host=192.168.35.197
cluster11 ansible_ssh_host=192.168.35.198
cluster12 ansible_ssh_host=192.168.35.199
# --------------- 









