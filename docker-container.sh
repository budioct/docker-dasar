# --DOCKER CONTAINER--
#// melihat list container yang berjalan dan tidak berjalan
docker container ls -a
docker container ls

#// membuat container
docker container create --name namacontainer namaimage:tag

#// running container
docker container start containerid/namecontainer

#// stoped container
docker container stop containerid/namacontainer

#// delete container
docker container rm containerid/namacontainer