# management penyimpanan container dengan storage docker volume
#docker container create --name mongovolume --publish 27019:27017 --mount "type={volume},source={namacontainer},destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=budhi --env MONGO_INITDB_ROOT_PASSWORD=budhi mongo:latest

docker volume create mongodata

docker container create --name mongovolume --publish 27019:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=budhi --env MONGO_INITDB_ROOT_PASSWORD=budhi mongo:latest

docker container stop mongovolume

docker container rm mongovolume

