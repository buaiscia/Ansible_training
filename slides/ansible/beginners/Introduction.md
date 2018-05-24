# Introduction

- This was initially written to support in-person, instructor-led trainings

- These materials are maintained by [Vladimir Germanov](@@TRAINER_PROFILE@@).
  If you want to contribute, please contact me!

- You can also follow along on your own, at your own pace

- I included as much information as possible in these slides

- I recommend having a mentor to help you ...

- ... Or be comfortable spending some time reading the Ansible
 [documentation](https://docs.ansible.com) ...

- ... And looking for answers in the [StackOverflow](http://stackoverflow.com/questions/tagged/ansible),
  and other outlets

---

## Objectives

**Automation with Ansible - Beginners is designed for system administrators**
**who are intending to use Ansible for automation, configuration, and management.**

- Students will learn how to install and configure Ansible

- Students will also create and run playbooks to configure systems, and
learn to manage inventories

- Students will manage encryption for Ansible with Ansible Vault

- Students will learn how to troubleshoot problems with Ansible Playbooks and
Ansible Managed Hosts

---

## Prerequisites

- Basic knowledge of Linux system administration and command-line tools

- Good to have knowledge of (but not mandatory)

  - Vim

  - Tmux/Screen

  - Basic Scripting (Bash, Python, Powershell)

---

## Training Lab environment

- Ansible playground: [@@LAB@@](@LAB@@)

- Training Git repo: [@@SLIDES_REPOS@@](@@SLIDES_REPOS@@)

- Presentation slides: [@@SLIDES@@](@@SLIDES@@)

---

## How to build your own LAB

- Fork training repo

- Open Ansible playground

  - Create new Instance

  - Clone your forked repo

  - Build empty lab

```bash
git clone https://git.homecredit.net/<USER>/<REPO> eit.trainings
cd eit.trainings/ansible/beginners/lab
./lab.sh -h
./lab.sh -e
```

---

.exercise[
```open @@SLIDES_REPOS@@```<br />
Fork it ! You will use your fork repo!<br />
```open @@LAB@@```<br />
Play-> Create new instance
```bash
git clone https://git.homecredit.net/<USER>/<REPO> eit.trainings
cd eit.trainings/ansible/beginners/lab
./lab.sh -h
./lab.sh -e
```
Play with the console and command-line tools
]

---

class: extra-details

## Tips and Tricks

- Ansible Playground

  - DON'T close browser window! You will lose everything!

  - Save + push to git more often

  - Ctrl+Ins (Copy) / Shift+Ins (Paste) or use mouse

  - Alt + Enter -> Full screen of terminal

- Vim

  - F2 -> pastetoggle

  - :w/:wq

  - :q!

---

class: extra-details

- Tmux

  - Ctrl +b % -> split vertical

  - Ctrl +b " -> split horizontal

  - Ctrl +b c -> new window

  - Ctrl +b d -> dettach

  - tmux list-sessions

- Screen

  - Ctrl +a d -> dettach

  - scren -ls

  - screen -S NAME

  - screen -r NAME

---

.exercise[
```vim```<br />
```tmux```<br />
```screen```<br />
]
