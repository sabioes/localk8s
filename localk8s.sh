#!/bin/bash

source environment_variables.sh

COMMAND=${1}

function usage {
    echo "
proviclus cli 1.0.0

COMMANDS:

Run a Hello World container with ansible:

    proviclus.sh helloworld

    "
}

if [[ -z ${COMMAND} ]]; then
    usage
    exit 1
fi

case ${COMMAND} in 

    startcontainer)
        echo "starting docker container"
        #docker run --rm -it localk8s:latest
        #docker run --network bridge -v "${PWD}":/work:ro -v "${PWD}"/ansible/roles:/root/.ansible/roles -v ~/.ssh:/root/.ssh:ro --rm localk8s:latest ansible-playbook ansible/install_k8s.yml -i ansible/hosts/hosts.ini 
        docker run --network bridge -v "${PWD}":/work -v "${PWD}"/ansible/roles:/root/.ansible/roles -v ~/.ssh:/root/.ssh:rw --add-host host.docker.internal:host-gateway --rm -it localk8s:latest 
    ;;

    anhelp)
        echo "docker container starting to get ansible help..."
        docker run --rm localk8s:latest ansible-playbook -h
    ;;

    *)
        echo "argument not found."
    ;;    
esac