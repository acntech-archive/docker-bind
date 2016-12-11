FROM ubuntu
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm


RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install wget apt-utils bind9 bind9utils bind9-doc

RUN mkdir /var/log/bind && \
    touch /var/log/bind/bind.log


COPY resources/default/bind9 /etc/default/bind9
COPY resources/bind/ /etc/bind/


RUN chown -R root:root /etc/bind


EXPOSE 53/tcp 53/udp 953


VOLUME ["/etc/bind", "/var/lib/bind", "/var/log/bind"]


CMD ["/usr/sbin/named", "-g"]