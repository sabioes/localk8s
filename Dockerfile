FROM ubuntu:22.04
ENV ANSIBLE_VERSION 2.15.3
#APT list update
RUN apt-get update
#APT install OpenSSH-Client
RUN apt-get install net-tools iputils-ping openssh-client -y
#APT install python3 and pip 
RUN apt-get install --no-install-recommends -y python3-pip && rm -rf /var/lib/apt/lists/*
RUN pip install pip --upgrade
#PIP install Ansible
RUN pip install ansible-core==${ANSIBLE_VERSION}
RUN apt-get update -y && DEBIAN_FRONTEND=nointeractive apt-get install -y --no-install-recommends sshpass
#Install Ansible dependencies
RUN ansible-galaxy collection install chocolatey.chocolatey ansible.windows community.general 

WORKDIR /work

# Login script
#COPY /core/startup.sh /work/core/
#CMD [ "bash", "-c", "source /work/core/startup.sh && bash" ]
