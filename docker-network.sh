# melihat list network
docker network ls

# membuat network
#docker network create --driver namadriver namanetwork
docker network create --driver bridge contohnetwork

# hapus network (syarat container sudah di hapus)
# docker network rm namanetwork
docker network rm contohnetwork