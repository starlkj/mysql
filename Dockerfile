FROM mariadb:10.1
ADD ./my.cnf /etc/mysql/my.cnf
EXPOSE 3306 4444 4567 4568