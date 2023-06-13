# strategi backup docker volume
# Tahapan Melakukan Backup
# ● Matikan container yang menggunakan volume yang ingin kita backup
# ● Buat container baru dengan dua mount, volume yang ingin kita backup, dan bind mount folder dari sistem host
# ● Lakukan backup menggunakan container dengan cara meng-archive isi volume, dan simpan di bindmount folder
# ● Isi file backup sekarang ada di folder sistem host
# ● Delete container yang kita gunakan untuk melakukan backup

docker container stop mongovolume

# absolute path lokasi simpan docker volume
# C:\Dev\2023\Docker\belajar-docker-dasar\backup

#docker container create --name nginxbackup --mount "type=bind,source={lokasihost/laptop},destination={lokasicontainer/folder}" --mount "type=volume,source={docker volume},destination={lokasicontainer/folder}" nginx:latest
docker container create --name nginxbackup --mount "type=bind,source=C:\Dev\2023\Docker\belajar-docker-dasar\backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest

docker container start nginxbackup /bin/bash

docker container exec -i -t nginxbackup /bin/bash
# ls -l, cari folder backup dan data, masuk ke folder data, masuk ke folder backup
# aplikasi tar untuk archive sebuah folder. dengan perintah: tar cvf /backup/backup.tar.gz /data

# backup data folder data ke folder backup dengan nama backup.tar.gz
tar cvf /backup/backup.tar.gz /data

# jika sudah selesai backup hentikan container backupnya
docker container stop nginxbackup

docker container rm nginxbackup

# jalankan kembali container yang management storagenya docker volume
docker container start mongovolume

# backup sekali langkah
# Menjalankan Container Secara Langsung
# ● Melakukan backup secara manual agak sedikit ribet karena kita harus start container terlebih dahulu, setelah backup, hapus container nya lagi
# ● Kita bisa menggunakan perintah run untuk menjalankan perintah di container dan gunakan
#parameter --rm untuk melakukan otomatis remove container setelah perintahnya selesai berjalan

docker image pull ubuntu:latest

docker container stop mongovolume

docker container run --rm --name ubuntubackup --mount "type=bind,source=C:\Dev\2023\Docker\belajar-docker-dasar\backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup-lagi.tar.gz /data

