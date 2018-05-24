# Implementing Playbooks

* Write YAML files

* Implement Ansible Playbooks

* Write and execute a playbook

---

## Writing YAML files

* YAML Ain’t Markup Language (YAML)

* Representation of data structures such as lists and
associative arrays in an easy to write, human-readable format

* Accomplished primarily by abandoning traditional enclosure syntax, such as brackets, braces, or
opening and closing tags

* Instead, in YAML, data hierarchy structures are maintained using outline indentation.

* Use spaces not TABs! (how to configure text redactors to use spaces insted of tabs?)

---

* Start of File

```yaml
---#start of line

```

* Comments

```yaml
## This is a comment
```

* Strings

```yaml
"This is a string"
This is a string
'This is a string'

multiline_string: |
Example Company
123 Main Street
Atlanta, GA 30303
```

---

* Booleans

```yaml
test_bool: True
```

* Lists

```yaml
- red
- green
- blue
fruits:
  - yellow
  - pink
test_list:
  [test1, test2, test3]
```

---

* Dictionaries

```yaml
key: value
course_name: Automation with Ansible
name: Vladimir Germanov
{course_name: Automation using Ansible, type: Beginners}
```

* Line Folding

```yaml
fold_line: >
            This is
            a very long,
            long, long, long
            sentence.
```

* verifying YAML syntax

```
python -c 'import yaml, sys; print yaml.load(sys.stdin)' < myyaml.yml
```

* [json2yaml](https://www.json2yaml.com/)

---

.exercise[
1. Write example YAML files
2. Verify them
]

---

## Implementing Modules

* Core - maintained by Ansible (shiped with Ansible)

* Extra - maintained by community (shiped with Ansible)

* Custom modules - own custom develped modules (NOT shiped with Ansible)

  * $ANSIBLE_LIBRARY

  * library = /usr/share/my_modules/

* Module Index/Categories [module_index](http://docs.ansible.com/ansible/latest/modules/modules_by_category.html)

* ```ansiblep-doc MODULE```

---

.exercise[
1. Discover ansible modules
]

---

## Implementing Ansible Playbooks
