# Introducing Ansible

* Ansible is an open source configuration management and orchestration utility. It can automate
and standardize the configuration of remote hosts and virtual machines. Its orchestration
functionality allows Ansible to coordinate the launch and graceful shutdown of multitiered
applications. Because of this, Ansible can perform rolling updates of multiple systems in a way
that results in zero downtime.

* Instead of writing custom, individualized scripts, system administrators create high-level plays in
Ansible. A play performs a series of tasks on the host, or group of hosts, specified in the play. A
file that contains one or more plays is called a playbook.

* Ansible's architecture is agentless. Work is pushed to remote hosts when Ansible executes.
Modules are the programs that perform the actual work of the tasks of a play. Ansible is
immediately useful because it comes with hundreds of core modules that perform useful system
administrative work

---

## Overview of Ansible Architecture

![ansible-architecture](images/ansible-architecture.png)

* Host inventory

* Playbooks

* Core / Custom modules

* Plugins / Connection plugins

---

## Ansible vs Other tools

* Jenkins

* Puppet

* Chef

* Fabric

1. Workflow - Push vs Pull

2. Server management - master -> controller
