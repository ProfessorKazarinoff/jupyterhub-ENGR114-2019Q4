# ansible-playbooks

from digital ocean tutorial:
https://www.digitalocean.com/community/tutorials/automating-initial-server-setup-with-ansible-on-ubuntu-18-04

## Install Ansible on WSL

```
sudo apt-get install ansible
```
Check ansible version

```
ansible --version
```

## Create a hosts file of servers that Ansible will manage

```
sudo nano /etc/ansible/hosts
```

In file ```hosts```:

```
[servers]
server1 ansible_host=203.0.113.111

[servers:vars]
ansible_python_interpreter=/usr/bin/python3
```

## Test connection between WSL and server

```
ansible -m ping all -u root
```

Should see the output

```
server1 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
```

## Copy playbook from this repo into WSL

```
curl -L https://raw.githubusercontent.com/professorkazarinoff/jupyterhub-ENGR114-2019Q4/master/ansible-playbooks/initial_server_setup.yml -o initial_server_setup.yml
```

This will download the contents of the playbook to a file named initial_server_setup.yml on WSL

## Run playbook from within WSL

```
ansible-playbook initial_server_setup.yml  -l server1
```

## SSH into the server as new user

```
ssh sammy@203.0.113.111   #use server IP address
```

## Confirm the Ansible playbook worked

These commands are on the remote server (not WSL)

```
sudo ufw status
```

Should see:

```
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere                  
OpenSSH (v6)               ALLOW       Anywhere (v6)
```
