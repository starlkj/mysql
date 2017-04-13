FROM mariadb:10.1
COPY replication-entrypoint.sh /usr/local/bin/replication-entrypoint.sh
ENTRYPOINT ["replication-entrypoint.sh"]