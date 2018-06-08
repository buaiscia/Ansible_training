# Deploying Ansible

* Install Ansible

* Manage Ansible Configuration Files

* Run Ansible ad-hoc commands

* Manage Inventory

---

## Installing Ansible

* Python v2 (v3 supported)

* SSH configuration (User authentication, Public key authentication)

* Install ansible via package management (or bleeding edge if needed)<br />
[Installation guide](http://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

.exercise[
```yum list installed python```<br />
```yum search ansible```<br />
```# yum install epel-release```<br />
```yum install ansible```<br />
Check SSH setup!<br/>
```ssh user@hosts```
]

---

## Managing Ansible Configuration Files

* /etc/ansible/ansible.cfg

* ~/.ansible.cfg

* ./ansible.cfg

* $ANSIBLE_CONFIG

```bash
ansible --version
grep "^\[" /etc/ansible/ansible.cfg
```

---

.exercise[
1. Define different configuration files and check the precedence
]

---

## Running Ansible Ad Hoc Commands

**ansible host-pattern -m module [-a 'module arguments'] [-i inventory]**

```bash
ansible --help
ansible -i '172.19.0.4,server02,server03.example.com,' \
all \
-m ping \
-u root \
-k \
-v \
--ssh-common-args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
```

* ad hoc command configuration in ansible configuration file

    * remote_user

    * host_key_checking

---

.exercise[
```ansible -i 'localhost,' all -u root -k -m ping```<br />
```ansible -i 'localhost,' all -a ls -l```<br />
```ansible -i 'server03,' all -a ls -l```<br />
]

---

## Managing Static Inventory

* groups: custom groups, all and ungrouped

* server[01:20]

* default inventory /etc/ansible/hosts

```
green.example.com
blue.example.com
192.168.100.1
192.168.100.10

[webservers]
alpha.example.org
beta.example.org
192.168.1.100
192.168.1.110

www[001:006].example.com
```

---

* inventory host patterns

    - 'webservers*'

    - 'lab:server01', 'lab:&server02', 'lab:!server01'

.exercise[
```ansible -i 'localhost,' all -u root -k -m ping```<br />
```ansible -i 'localhost,' all -a ls -l```<br />
```ansible -i 'server03,' all -a ls -l```<br />
Exercise inventory host patterns!
]

---

## Managing Dynamic Inventories

* to be discussed later
