FROM mysql:5.6
ENV REPLICATION_USER exntu
ENV REPLICATION_PASSWORD t~paas
COPY replication-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["replication-entrypoint.sh"]
CMD ["mysqld"]
