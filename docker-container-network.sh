# membuat docker network
docker network create --driver bridge mongonetwork

# membuat container yang akan dimasukan ke network
#docker container create --name mongodb --publish 27020:27017 --mount "type=volume,source=mongodatarestore,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=budhi --env MONGO_INITDB_ROOT_PASSWORD=budhi mongo:latest
# port tidak di publish karna mau akses lewat webnya saja
docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=budhi --env MONGO_INITDB_ROOT_PASSWORD=budhi mongo:latest

# kita butuh image mongo admin
docker image pull mongo-express:latest

# kita bikin container network untuk mongo-express
docker container create --name mongodbexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://budhi:budhi@mongodb:27017/" mongo-express:latest

docker container start mongodb

docker container start mongodbexpress

# menghapus container dari network
# docker network disconnect namanetwork namacontainer
docker network disconnect mongonetwork mongodb

# menambahkan container ke network
# docker network connect namanetwork namacontainer
docker network connect mongonetwork mongodb

