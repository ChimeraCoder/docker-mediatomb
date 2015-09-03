FROM debian:wheezy
MAINTAINER Aditya Mukerjee <dev@chimeracoder.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update --fix-missing
RUN apt-get install -y bash 

RUN apt-get install -y mediatomb

RUN chown -R mediatomb:users /media

EXPOSE 50500
EXPOSE 1900
EXPOSE 41570

USER mediatomb
WORKDIR /var/lib/mediatomb

CMD exec mediatomb --ip `/sbin/ip route | awk '/src/ { print $9 }' | head -n1` --port 50500
