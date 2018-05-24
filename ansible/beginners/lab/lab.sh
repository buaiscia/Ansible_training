#!/bin/bash

# Purpose: Script used to create/destroy docker container labs
# Author: Vladimir Germanov <vladimir.germanov@embedit.cz>

function help() {
    echo ""
    echo -ne "-h, --help | prints this help message\n"
    echo -ne "-d, --destroy | destroy all containers\n"
    echo -ne "-a, --ansible | build ansible lab\n"
    echo -ne "-e, --empty | build empty lab\n"
    echo -ne "-c, --check | check status of the lab\n"
    echo ""
}

function destroy_lab() {
    does_network_exists lab_empty && \
        echo "Destroying lab_empty..." && \
        docker-compose -f docker-compose-empty-lab.yml down

    does_network_exists lab_ansible && \
        echo "Destroying lab_ansible..." && \
        docker-compose -f docker-compose-ansible-lab.yml down

    cat /etc/hosts.bak > /etc/hosts
    rm -rf /etc/ansible/
    rm -f /root/.ssh/config
}

function check_lab() {
    echo "Status of lab..."

    does_network_exists lab_empty && docker-compose -f docker-compose-empty-lab.yml ps
    does_network_exists lab_ansible && docker-compose -f docker-compose-ansible-lab.yml ps
}

function build_lab() {
    echo "Building lab_${MODE}..."

    mkdir -p /etc/ansible/
    cp ./common/ansible.cfg /etc/ansible/ansible.cfg
    cp ./common/inventory /etc/ansible/hosts
    cp ./common/ssh_config /root/.ssh/config && chmod 640 /root/.ssh/config

    echo "# generated automatically when lab is started" >> /etc/hosts

    if [ "${MODE}" == "empty" ]; then
        docker-compose -f docker-compose-empty-lab.yml up -d
    elif [ "${MODE}" == "ansible" ]; then
        docker-compose -f docker-compose-ansible-lab.yml up -d
    fi

    for container in ansible server01 server02 server03;
    do
        CONTAINER_IP=$( get_container_ip $container )
        echo "${container} ansible_host=${CONTAINER_IP}" >> /etc/ansible/hosts
        echo "${CONTAINER_IP}   ${container}" >> /etc/hosts
    done
}

function get_container_ip() {
    local IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1)
    echo $IP
}

function does_container_exist() {
    return $(docker inspect $1 >/dev/null 2>&1)
}

function is_container_running() {
    [[ "$(docker inspect -f "{{.State.Running}}" $1 2>/dev/null)" == "true" ]]
}

function does_network_exists() {
    return $(docker network inspect $1 >/dev/null 2>&1)
}

function kill_container_if_exists() {
    does_container_exist $1 && echo "killing/removing container $1" && { docker kill $1 >/dev/null 2>&1; docker rm $1 >/dev/null 2>&1; };
}

# START

MODE=""

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    help
    exit 1
fi

for i in "$@"; do
case $i in
    -d|--destroy)
    MODE="destroy"
    shift # past argument=value
    ;;
    -e|--empty)
    MODE="empty"
    shift # past argument=value
    ;;
    -a|--ansible)
    MODE="ansible"
    shift # past argument=value
    ;;
    -c |--check)
    MODE="check"
    shift # past argument=value
    ;;
    -h|--help)
    help
    exit 0
    shift # past argument=value
    ;;
    *)
    echo "Unknow argument ${i#*=}"
    exit 1
esac
done

if [ "${MODE}" == "destroy" ]; then
    destroy_lab
elif [ "${MODE}" == "empty" ] || [ "${MODE}" == "ansible" ]; then
    build_lab
elif [ "${MODE}" == "check" ]; then
    check_lab
else
    echo "Unknown mode: ${MODE}"
    exit 1
fi

exit 0
