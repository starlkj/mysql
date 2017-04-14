FROM mariadb:10.1
COPY init-galera.sh /usr/local/bin/init-galera.sh
RUN chmod 755 /usr/local/bin/init-galera.sh \
   && init-galera.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]