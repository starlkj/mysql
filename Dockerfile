FROM mariadb:10.1
COPY replication-entrypoint.sh /replication-entrypoint.sh
RUN CHMOD 755 /replication-entrypoint.sh \
   && /replication-entrypoint.sh