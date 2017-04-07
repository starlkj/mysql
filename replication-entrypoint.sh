#!/bin/bash
set -eo pipefail

cat > /etc/mysql/my.cnf << EOF
[client]
port            = 3306
socket          = /var/run/mysqld/mysqld.sock
default-character-set = utf8

[mysqld_safe]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
nice            = 0

[mysqld]
user            = mysql
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
port            = 3306
basedir         = /usr
datadir         = /var/lib/mysql
tmpdir          = /tmp
lc-messages-dir = /usr/share/mysql
explicit_defaults_for_timestamp
init_connect    = "SET collation_connection = utf8_general_ci"
init_connect    = "SET NAMES utf8"
character-set-server = utf8
collation-server = utf8_general_ci

server-id      = $SERVER_ID
log_bin        = /var/log/mysql/mysql-bin.log
binlog_do_db   = $DB_NAME
sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
symbolic-links=0
!includedir /etc/mysql/conf.d/


# performance setting
#join_buffer_size        = 192K
#tmp_table_size          = 16M
#max_heap_table_size     = 16M
#innodb_buffer_pool_size = 4G
#query_cache_type        = 0

[mysql]
default-character-set = utf8

[mysqldump]
default-character-set = utf8
EOF

cat >/docker-entrypoint-initdb.d/init-master.sh  <<'EOF'
#!/bin/bash
echo Creating replication user ...
mysql -u root -e "\
  GRANT \
    FILE, \
    SELECT, \
    SHOW VIEW, \
    LOCK TABLES, \
    RELOAD, \
    REPLICATION SLAVE, \
    REPLICATION CLIENT \
  ON *.* \
  TO '$REPLICATION_USER'@'%' \
  IDENTIFIED BY '$REPLICATION_PASSWORD'; \
  FLUSH PRIVILEGES; \
"

exec docker-entrypoint.sh "$@"