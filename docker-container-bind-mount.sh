# create container yang bisa di akses dari host(laptop) ke docker container dan merubah environment secara dinamis
# dengan mounting dari host ke deamon container, data db bisa tersimpan di host juga
#docker container create --name mongodata --publish 27018:27017 --mount "type={bind},source={lokasihost/laptop},destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=budhi --env MONGO_INITDB_ROOT_PASSWORD=budhi mongo:latest
docker container create --name mongodata --publish 27018:27017 --mount "type=bind,source=C:\Dev\2023\Docker\belajar-docker-dasar\mongo-data,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=budhi --env MONGO_INITDB_ROOT_PASSWORD=budhi mongo:latest
