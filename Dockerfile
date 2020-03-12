FROM gliderlabs/alpine:3.3
## Install all the things that makes Ansible happy
RUN apk-install curl openssh-client python python-dev py-pip py-setuptools tar gcc g++ make libffi-dev openssl-dev
RUN pip install --upgrade pip python-keyczar ansible netaddr
RUN mkdir /etc/ansible/ /ansible && touch /etc/ansible/hosts

RUN mkdir -p /ansible/playbooks
WORKDIR /ansible/playbooks

ENV PYTHONPATH /ansible/lib
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles