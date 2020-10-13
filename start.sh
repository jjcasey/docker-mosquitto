#! /bin/sh
docker container rm mosquitto || /bin/true
docker run -td \
	--restart always \
	-e DEBBASE_SYSLOG=stdout \
	-e DEBBASE_TIMEZONE=`cat /etc/timezone` \
	--stop-signal=SIGRTMIN+3 \
	--tmpfs /run:size=100M \
	--tmpfs /run/lock:size=100M \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	-v /var/lib/mosquitto:/var/lib/mosquitto \
	-v ${PWD}/mosquitto.conf:/etc/mosquitto/conf.d/mosquitto.conf \
	-p 1883:1883 \
	--network lan-services \
	--name=mosquitto \
	mosquitto
