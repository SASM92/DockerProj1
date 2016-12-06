#!/bin/bash
 
EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`
 
$ mysql -u root -p
 
Q1="CREATE DATABASE zabbixdb;"
Q2="GRANT ALL on zabbixdb.* to zabbix@localhost IDENTIFIED BY 'password';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"

