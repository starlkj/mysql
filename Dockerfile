FROM mysql:5.6
ENV REPLICATION_USER exntu
ENV REPLICATION_PASSWORD t~paas
ENV SERVER_ID t~paas
ENV DB_NAME exntu
COPY replication-entrypoint.sh /usr/local/bin/
exec replication-entrypoint.sh
