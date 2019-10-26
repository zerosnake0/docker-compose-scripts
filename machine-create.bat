setlocal
set ds=%~dp0
rem must eliminate the trailing slash
set ds=%ds:~0,-1%
docker-machine rm -y default
c:
cd "c:/Program Files/Docker Toolbox"
docker-machine create ^
  --driver virtualbox ^
  --engine-registry-mirror https://docker.mirrors.ustc.edu.cn ^
  --engine-registry-mirror http://hub-mirror.c.163.com ^
  --engine-insecure-registry hub-mirror.c.163.com ^
  --virtualbox-boot2docker-url ./boot2docker.iso ^
  --virtualbox-share-folder "%ds%:docker-share" ^
  default
docker-machine ssh default "sudo mkdir -p /docker-share"
docker-machine ssh default "sudo mount -t vboxsf -o umask=0077 docker-share /docker-share"
endlocal
