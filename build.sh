#! /bin/sh
adduser --system --group --home /var/lib/mosquitto mosquitto
mkdir -p identity
getent passwd mosquitto > identity/passwd
getent group mosquitto > identity/group
getent shadow mosquitto > identity/shadow
docker network create -d bridge lan-services || /bin/true
docker build --network lan-services -t mosquitto .
