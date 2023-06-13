# --DOCKER CONTAINER LOGS--

#// membuat container
docker container create --name namacontainer namaimage:tag

#// running container
docker container start containerid/namecontainer

#// melihat logs dari cotnainer
docker container logs containerid/namacontainer

#// melihat logs dari cotnainer realtime
docker container logs -f containerid/namacontainer

