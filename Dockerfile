FROM debian-security-apt-cacher-ng:latest
COPY identity/ /tmp/identity/
COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/040-mosquitto
EXPOSE 1883
CMD ["/usr/local/bin/boot-debian-base"]
