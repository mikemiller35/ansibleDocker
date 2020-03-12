FROM python:3.7-alpine
## Install all the things that makes Ansible happy
RUN apk add openssh-client openssl-dev gcc g++ make \
    python python-dev py-pip py-setuptools libffi-dev
RUN pip install --upgrade pip python-keyczar ansible netaddr
RUN mkdir -p etc/ansible/playbooks /ansible && ln -s /ansible/playbooks/hosts /etc/ansible/hosts

WORKDIR /ansible/playbooks

ENV PYTHONPATH /ansible/lib
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles