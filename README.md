## How do I Use It

### Install Docker

Read more [here](https://docs.docker.com/install/linux/docker-ce/centos/)

```
$ sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
```

```
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

```
$ sudo yum install docker-ce docker-ce-cli containerd.io
```

```
$ sudo systemctl start docker
```

### Run it

```
[mike@Mikes-MBP ansibleDocker ]$ docker run --rm -it --volume $('pwd'):/ansible/playbooks mmiller/ansible /bin/ash
/ansible/playbooks # vi /etc/ansible/hosts 
/ansible/playbooks # cat /etc/ansible/hosts 
[target]
127.0.0.1
/ansible/playbooks # ansible-playbook testPlaybook.yml 

PLAY [127.0.0.1] *******************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************
[WARNING]: Platform linux on host 127.0.0.1 is using the discovered Python interpreter at /usr/bin/python, but future installation of another Python interpreter could change this.
See https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.
ok: [127.0.0.1]

TASK [debug] ***********************************************************************************************************************************************************************
ok: [127.0.0.1] => {
    "msg": "Yay!"
}

PLAY RECAP *************************************************************************************************************************************************************************
127.0.0.1                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

/ansible/playbooks # exit
[mike@Mikes-MBP ansibleDocker ]$
```

### What I need to do

- Make this a bit more automated and simplify it
- Get the Docker image into Jfrog or Dockerhub