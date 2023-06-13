# install image mongo-db dari docker hub
docker image pull mongo:latest

# create container yang bisa di akses dari host(laptop) ke docker container dan merubah environment secara dinamis
docker container create --name contohmongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=budhi --env MONGO_INITDB_ROOT_PASSWORD=budhi mongo:latest

