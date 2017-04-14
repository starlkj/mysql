#!/bin/bash

cat > /etc/mysql/conf.d/mysql_server.cnf << EOF
#
# Galera Cluster: mandatory settings
#

[server]
bind-address=0.0.0.0
binlog_format=row
default_storage_engine=InnoDB
innodb_autoinc_lock_mode=2
innodb_locks_unsafe_for_binlog=1
query_cache_size=0
query_cache_type=0

[galera]
wsrep_on=ON
wsrep_provider="/usr/lib/galera/libgalera_smm.so"
wsrep_cluster_address="gcomm://mariadb-node-0,mariadb-node-1,mariadb-node-2"
wsrep-sst-method=rsync

#
# Optional setting
#

# Tune this value for your system, roughly 2x cores; see https://mariadb.com/kb/en/mariadb/galera-cluster-system-variables/#wsrep_slave_threads
# wsrep_slave_threads=1

# innodb_flush_log_at_trx_commit=0
EOF