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
[![](https://images.microbadger.com/badges/version/mmillerlb/ansibledocker.svg)](https://hub.docker.com/r/mmillerlb/ansibledocker "Dockhub Link")

```
$ sudo docker pull mmillerlb/ansibledocker
$ sudo docker run --rm -it --volume $('pwd'):/ansible/playbooks mmillerlb/ansibledocker /bin/ash
## Depending on the networking, might need to run this one
$ sudo docker run --rm -it --network=host --volume $('pwd'):/ansible/playbooks mmillerlb/ansibledocker /bin/ash
```

```
[mike@Mikes-MBP ansibleDocker ]$ docker run --rm -it --volume $('pwd'):/ansible/playbooks mmiller/ansibledocker /bin/ash
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
- Document all commands when running this from Cent or Rhel
  - The install docker part

---

### Running the image from my Mac

```
[mike@Mikes-MBP ansible (onprem23 ✗)]$ pwd
/Users/mike/Projects/ansible

[mike@Mikes-MBP ansible (onprem23 ✗)]$ ll
total 110920
-rw-r--r--   1 mike  staff   1.1K Mar 14 00:29 README.md
-rwxr-xr-x   1 mike  staff   657B Mar 14 00:29 ansible.cfg*
-rw-r--r--   1 mike  staff    54M Mar 14 01:00 ansible_log
-rw-r--r--   1 mike  staff   534B Mar 14 00:29 bastion_ssh.cfg
-rw-r--r--   1 mike  staff   1.2K Jan  7 21:22 build_ffmpeg.yml
-rw-r--r--   1 mike  staff   393B Jan  7 21:22 chg_install_path.yml
drwxr-xr-x   5 mike  staff   160B Mar 14 00:29 cloudFormation/
drwxr-xr-x   3 mike  staff    96B Jan  7 21:22 group_vars/
drwxr-xr-x   3 mike  staff    96B Mar 14 00:29 host_vars/
-rw-r--r--   1 mike  staff   347B Mar 14 00:35 hosts
-rw-r--r--   1 mike  staff    10K Jan  7 18:19 install_reachengine.yml
-rw-r--r--   1 mike  staff   215B Feb 24 21:21 license.lic
drwxr-xr-x  15 mike  staff   480B Jan  7 18:23 roles/
-rw-r--r--   1 mike  staff   327B Jan  7 21:22 runindexer.yml
-rw-r--r--   1 mike  staff    99B Jan  7 21:22 runlevel.yml
-rw-r--r--   1 mike  staff   228B Jan  7 21:22 scan_system.yml
-rw-r--r--   1 mike  staff   201B Jan  7 21:22 setup_licenses.yml

[mike@Mikes-MBP ansible (onprem23 ✗)]$ docker run --rm -it --volume $('pwd'):/ansible/playbooks mmillerlb/ansibledocker /bin/ash

/ansible/playbooks # ls -l
total 55460
-rw-r--r--    1 root     root          1119 Mar 14 06:29 README.md
-rwxr-xr-x    1 root     root           657 Mar 14 06:29 ansible.cfg
-rw-r--r--    1 root     root      56661574 Mar 14 07:00 ansible_log
-rw-r--r--    1 root     root           534 Mar 14 06:29 bastion_ssh.cfg
-rw-r--r--    1 root     root          1215 Jan  8 04:22 build_ffmpeg.yml
-rw-r--r--    1 root     root           393 Jan  8 04:22 chg_install_path.yml
drwxr-xr-x    5 root     root           160 Mar 14 06:29 cloudFormation
drwxr-xr-x    3 root     root            96 Jan  8 04:22 group_vars
drwxr-xr-x    3 root     root            96 Mar 14 06:29 host_vars
-rw-r--r--    1 root     root           347 Mar 14 06:35 hosts
-rw-r--r--    1 root     root         10578 Jan  8 01:19 install_reachengine.yml
-rw-r--r--    1 root     root           215 Feb 25 04:21 license.lic
drwxr-xr-x   15 root     root           480 Jan  8 01:23 roles
-rw-r--r--    1 root     root           327 Jan  8 04:22 runindexer.yml
-rw-r--r--    1 root     root            99 Jan  8 04:22 runlevel.yml
-rw-r--r--    1 root     root           228 Jan  8 04:22 scan_system.yml
-rw-r--r--    1 root     root           201 Jan  8 04:22 setup_licenses.yml

/ansible/playbooks # ansible-playbook install_reachengine.yml -vv
ansible-playbook 2.9.6
  config file = /ansible/playbooks/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.7/site-packages/ansible
  executable location = /usr/local/bin/ansible-playbook
  python version = 3.7.7 (default, Mar 11 2020, 01:01:39) [GCC 9.2.0]
Using /ansible/playbooks/ansible.cfg as config file
SSH password:

...
...
...

PLAY RECAP ********************************************************************************************************************************************************************
192.168.1.30               : ok=466  changed=31   unreachable=0    failed=0    skipped=334  rescued=0    ignored=0

/ansible/playbooks #

```