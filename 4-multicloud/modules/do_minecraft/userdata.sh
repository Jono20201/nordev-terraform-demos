#!/usr/bin/env sh
cd /root || exit
export DEBIAN_FRONTEND=noninteractive
apt update -y
apt upgrade -y
apt install openjdk-8-jre-headless screen awscli cron -y
wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar -O /root/minecraft_server.jar
echo "eula=true" > /root/eula.txt
screen -dmS minecraft /usr/bin/java -Xmx1024M -Xms1024M -jar /root/minecraft_server.jar nogui
aws configure set aws_access_key_id "${aws_access_key_id}"
aws configure set aws_secret_access_key "${aws_secret_access_key}"
aws configure set default.region eu-west-1

BACKUP_SCRIPT="#!/usr/bin/env sh
screen -d -m bash -c
screen -S minecraft -X stuff '/save-all\\n'
screen -S minecraft -X stuff '/save-off\\n'
sleep 5
tar -czvf backup.tar.gz /root/*
screen -S minecraft -X stuff '/save-on\\n'
aws s3 cp backup.tar.gz s3://${aws_backup_bucket_name}/backup.\$(date +\"%Y%m%d_%H%M%S\").tar.gz
rm -f backup.tar.gz"

echo "$BACKUP_SCRIPT" > /root/backup.sh
echo "* * * * * root /bin/sh /root/backup.sh > /root/backup.log 2>&1" > /etc/cron.d/minecraft-backup