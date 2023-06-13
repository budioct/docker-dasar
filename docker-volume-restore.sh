# Tahapan Melakukan Restore
# ● Buat volume baru untuk lokasi restore data backup
# ● Buat container baru dengan dua mount, volume baru untuk restore backup, dan bind mount folder dari sistem host yang berisi file backup
# ● Lakukan restore menggunakan container dengan cara meng-extract isi backup file ke dalam volume
# ● Isi file backup sekarang sudah di restore ke volume
# ● Delete container yang kita gunakan untuk melakukan restore
# ● Volume baru yang berisi data backup siap digunakan oleh container baru

# Buat volume baru untuk lokasi restore data backup
docker volume create mongodatarestore

# perintah restore yang dilakukan container ke volume
bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"

# restore dari container ke volume mongodatarestore
docker container run --rm --name ubuntubackup --mount "type=bind,source=C:\Dev\2023\Docker\belajar-docker-dasar\backup,destination=/backup" --mount "type=volume,source=mongodatarestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"

# mengalihkan data dari volume ke container
docker container create --name mongorestore --publish 27020:27017 --mount "type=volume,source=mongodatarestore,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=budhi --env MONGO_INITDB_ROOT_PASSWORD=budhi mongo:latest

docker container start mongorestore

