#!/bin/sh

for YAML in *.yml; do
  ./markmaker.py $YAML > ${YAML%%.*}.html || {
    rm ${YAML%%.*}.html
    break
  }
  cp ${YAML%%.*}.html /home/vlado/Ansible/Trainings/germanov.pages.homecredit.net/public/trainings/ansible/beginners/index.html
done
