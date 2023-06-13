#melihat komsumsi pengunaan resource container yang running
docker container stats

# membuat container dengan publish port ke host ke container dengan resource limit
docker container create --name smallnginx --publish 8081:80 --memory 100m --cpus 0.5 nginx:latest