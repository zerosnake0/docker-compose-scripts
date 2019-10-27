# docker-machine-ipconfig
Allows one to toggle between static and DHCP docker-machine network interface settings.

This is helpful when running a local docker swarm and you need to have your docker machine VMs maintain static IP addresses.

Works for Mac OS x and Cygwin docker clients. Probably works on Linux, but hasn't been tested there yet.

# Installation
Place the `docker-machine-ipconfig` script on your path in whatever manner you see fit.

# Usage
**Warning:** Using this script to modify your machine configuration will stomp on and/or delete an existing `/var/lib/boot2docker/bootsync.sh` file. There are no checks at the moment to prevent adverse behavior. Use responsibly. Any pull requests to address this are welcome :)

## List running docker-machines' ip addresses
```
$ docker-machine-ipconfig ls
Machine              State    IP Address
------------------------------------------------
discovery-keystore   static   192.168.99.100
fivestars            static   192.168.99.102
loyalty              dhcp     192.168.99.103
```

## Configure machine to use a static IP address
Set the current DHCP-assigned address as the machine's static IP address.
```
$ docker-machine-ipconfig static loyalty
Regenerating TLS certificates
Waiting for SSH to be available...
Detecting the provisioner...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
    inet 192.168.99.103/24 brd 192.168.99.255 scope global eth1
docker-machine "loyalty" now has a static ip address
```

One can specify an explicit IP address to override the default implicit value.
```
$ docker-machine-ipconfig static loyalty 192.168.99.110
Regenerating TLS certificates
Waiting for SSH to be available...
Detecting the provisioner...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
    inet 192.168.99.110/24 brd 192.168.99.255 scope global eth1
docker-machine "loyalty" now has a static ip address
```

## Configure machine to use the DHCP service to allocate an address
```
$ docker-machine-ipconfig dhcp loyalty
udhcpc (v1.24.2) started
Sending discover...
Sending discover...
Sending select for 192.168.99.103...
Lease of 192.168.99.103 obtained, lease time 1200
docker-machine "loyalty" now has a dynamic ip address
```

## Add entries for the static address machines to your `/etc/hosts` file
```
$ docker-machine-ipconfig hosts

# /etc/hosts
--------------------------------
192.168.99.106       connect
192.168.99.104       websocket
192.168.99.100       discovery-keystore
192.168.99.102       fivestars
192.168.99.103       loyalty
```

## Thanks

Thanks to [@micheletedeschi](https://github.com/micheletedeschi) and all the other helpful participants in the docker/machine [issue thread 1709](https://github.com/docker/machine/issues/1709)
