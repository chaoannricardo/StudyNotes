# ansible Guide

# "Playbooks" contain "plays"
# "Plays" contain "tasks"
# "Tasks" call "modules"
# "Tasks" run sequentially
# "Handlers" are triggered by "tasks"
# and are run once, at the end of plays

# make directory for playbooks storage; 
sudo mkdir /etc/ansible/yml # the place to store playbook.
sudo chown -R student:student /etc/ansible/

# how to run ===============================================
ansible test -a "touch /home/student/lalala" # ansible <group> -a <remote command>
ansible-playbook /etc/ansible/yml/Got.yaml # ansible-playbook <playbook-path>
ansible hadoop -m shell -a 'free -hm' # ansible <group> shell(shell command) -> to view free memory within each cluster 

# Examples ===============================================
# --------------- NEW
---
- name: install and start apache
  hosts: test
  remote_user: student

  tasks:
   - name: copy authorized_keys.j2 to all
     template: src=/home/student/GOT dest=/home/student mode=777
# --------------
# --------------- NEW
---
- hosts: ssh
  gather_facts: no

  tasks:
    - name: enforce env   
      shell: source /etc/profile
      run_once: true
    - name: close ssh check  #关闭初次访问提示询问   
      shell: sed -i "s/^.*StrictHostKeyChecking.*$/   StrictHostKeyChecking no/g" /etc/ssh/ssh_config
    - name: delete /root/.ssh/
      file: path=/root/.ssh/ state=absent
    - name: generating public/private rsa key pair  #生成公钥和私钥
      shell: ssh-keygen -t rsa -b 2048 -N '' -f /root/.ssh/id_rsa
    - name: view id_rsa.pub  #将公钥设置成变量
      shell: cat /root/.ssh/id_rsa.pub
      register: sshinfo
    - set_fact: sshpub={{sshinfo.stdout}}
    - name: add ssh record #合并各个节点公钥
      local_action: shell echo {{sshpub}} >> {{AnsibleDir}}/roles/templates/authorized_keys.j2
    - name: copy authorized_keys.j2 to all #分发到各个节点上
      template: src={{AnsibleDir}}/roles/templates/authorized_keys.j2 dest=/root/.ssh/authorized_keys mode=0600
      tags:
       - install ssh
# --------------- 





















