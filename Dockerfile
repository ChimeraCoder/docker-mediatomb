FROM debian:wheezy
MAINTAINER Aditya Mukerjee <dev@chimeracoder.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update --fix-missing
RUN apt-get install -y bash 

RUN apt-get install -y mediatomb


RUN mkdir /.mediatomb
RUN chown -R mediatomb:mediatomb /.mediatomb
RUN chown -R mediatomb:users /media

USER mediatomb

EXPOSE 50500
EXPOSE 1900
EXPOSE 41570

CMD exec mediatomb -p 50500
