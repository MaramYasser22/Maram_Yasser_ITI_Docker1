FROM ubuntu:14.04
ENV CACHED_FLAG 1
ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update -qq
RUN apt-get -y upgrade
RUN apt-get -y install mysql-client mysql-server pwgen

#binding all interfaces
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD startdb.sh /startdb.sh

# Set the environment variables
ENV WPDB wordpress
ENV WPUSER wpuser
ENV WPPASS random

ENTRYPOINT [ "/bin/bash","/startdb.sh" ]

EXPOSE 3306
