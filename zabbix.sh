#!/bin/bash 

apache2(){

apt install apache2 apache2-utils -y

}

instalacao_do_zabbix(){

echo ""
echo " 
wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-5+debian12_all.deb
dpkg -i zabbix-release_6.0-5+debian12_all.deb

apt update

}
 
instalacao_zabbix_server_frontend_agent(){

apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent -y

}

criacao_inicial_de_dados(){

mysql -uroot -p
password
mysql> create database zabbix character set uft8mb4 collate utf8mb4_bin;
mysql> create user zabbix@localhost identified by 'password';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> set global log_bin_trust_function_creators = 1;
mysql> quit;

}

zabbix_server_host_data(){

zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix

}

disable_log(){

mysql -uroot -p
password
mysql> set global log_bin_trust_function_creators = 0;
mysql> quit;

}

configure_database(){

DBPassword=password

}

start_zabbix_server(){ 

systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2

}
