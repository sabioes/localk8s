FROM ubuntu:22.04
ENV ANSIBLE_VERSION 2.15.3

RUN apt-get update
#RUN add-apt-repository ppa:ansible/ansible
CMD [add-apt-repository ppa:ansible/ansible, ""]
RUN apt install ansible ${ANSIBLE_VERSION} -y
RUN apt-get clean all
RUN ansible --version