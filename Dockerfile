FROM mariadb:10.1
COPY replication-entrypoint.sh /usr/local/bin/replication-entrypoint.sh
RUN chmod 755 /usr/local/bin/replication-entrypoint.sh \
   && replication-entrypoint.sh