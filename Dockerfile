# # MariaDB Galera 5.5.39/Ubuntu 14.04 64bit
FROM ubuntu:14.04
MAINTAINER KJ <starlkj@exntu.com>

# mysql install 
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list 
RUN apt-get -q -y update 
RUN apt-get -q -y install software-properties-common 
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db 
RUN add-apt-repository 'deb http://ftp.cc.uoc.gr/mirrors/mariadb/repo/5.5/ubuntu trusty main' 
RUN apt-get -q -y update 
RUN echo mariadb-galera-server-5.5 mysql-server/root_password password root | debconf-set-selections
RUN echo mariadb-galera-server-5.5 mysql-server/root_password_again password root | debconf-set-selections 
RUN LC_ALL=en_US.utf8 DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confnew' -qqy install mariadb-galera-server galera mariadb-client

# upload the locally created my.cnf
ADD ./my.cnf /etc/mysql/my.cnf
RUN service mysql restart 
EXPOSE 3306 4444 4567 4568 
