FROM mysql:5.6
ENV REPLICATION_USER exntu
ENV REPLICATION_PASSWORD t~paas
ENV SERVER_ID 1
ENV DB_NAME exntu
COPY replication-entrypoint.sh /usr/local/bin/replication-entrypoint.sh
ENTRYPOINT ["replication-entrypoint.sh"]
CMD ["mysqld"]
