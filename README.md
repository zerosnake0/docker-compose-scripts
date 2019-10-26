# introduction

This repository is mainly for windows, there will be less problem if you use linux

# mount directory on windows

use `machine-create.bat`

# docker command slow and cannot connect to docker daemon

check the environments

```shell
docker-machine env
```

results in

```shell
DOCKER_HOST=tcp://192.168.99.100:2376
DOCKER_MACHINE_NAME=default
DOCKER_TLS_VERIFY=1
DOCKER_TOOLBOX_INSTALL_PATH=C:\Program Files\Docker Toolbox
DOCKER_CERT_PATH=%HOME%\.docker\machine\machines\default
```

docker command may fail if `DOCKER_HOST` is not `tcp://192.168.99.100:2376`

use the script in docker-machine-ipconfig directory(from ```https://github.com/fivestars/docker-machine-ipconfig```)

the following command use `GitBash`

```shell
./docker-machine-ipconfig static default 192.168.99.100
```

# (optional) docker registry in docker machine

when the daemon.json need to be modified

```shell
docker-machine ssh
sudo su
# modify /etc/docker/daemon.json
/etc/init.d/docker restart
```

## daemon.json example
```json
{
  "registry-mirrors": [
    "https://docker.mirrors.ustc.edu.cn",
    "http://hub-mirror.c.163.com"
  ],
  "insecure-registries": [
    "hub-mirror.c.163.com"
  ]
}
```

# port mapping

in directory `docker-machine-port-forwarder`

```shell
pf 80
```