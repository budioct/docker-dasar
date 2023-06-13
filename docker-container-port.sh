# install image nginx dari docker hub
docker image pull nginx:latest

# create container yang bisa di akses dari host(laptop) ke docker container
docker container create --name namcontainer --publish 8080:80 nginx:latest

