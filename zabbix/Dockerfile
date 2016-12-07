FROM base
MAINTAINER Sam

#change directory
WORKDIR /opt/

#download AMP
RUN apt-get update
RUN apt-get install apache2 -y

#input for terminal
RUN echo 'mysql-server mysql-server/root_password password 123' | debconf-set-selections 
RUN echo 'mysql-server mysql-server/root_password_again password 123' | debconf-set-selections
RUN apt-get install mysql-server -y 
RUN apt-get install php7.0 php7.0-cli php7.0-common php7.0-mysql libapache2-mod-php7.0 php7.0-cgi php7.0-xmlreader php7.0-xmlwriter php7.0-bcmath php7.0-mbstring -y

RUN sed -i 's/\;date\.timezone\ =/date.timezone\ =\ UTC/' /etc/php/7.0/apache2/php.ini

#adding zabbix apt repository
RUN wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+xenial_all.deb
RUN dpkg -i zabbix-release_3.2-1+xenial_all.deb
RUN apt-get update

#install zabbix server
RUN apt-get install -q zabbix-server-mysql zabbix-frontend-php -y

#set up database
RUN service mysql start \
&& mysql -u root -p123 -e "CREATE USER 'zabbix';"\
&& mysql -u root -p123 -e "CREATE DATABASE zabbixdb;"\
&& mysql -u root -p123 -e "GRANT ALL on zabbixdb.* to zabbix@localhost IDENTIFIED BY '123';"\
&& mysql -u root -p123 -e "FLUSH PRIVILEGES;"

WORKDIR /usr/share/doc/zabbix-server-mysql
RUN service mysql start \
&& zcat create.sql.gz | mysql zabbixdb -u zabbix -p123

#search and change lines with new values
RUN sed -i '/# DBHost=/c\DBHost=localhost' /etc/zabbix/zabbix_server.conf
RUN sed -i '/DBName=/c\DBName=zabbixdb' /etc/zabbix/zabbix_server.conf
RUN sed -i '/# DBPassword=/c\DBPassword=123' /etc/zabbix/zabbix_server.conf
RUN sed -i '/# DBPort=/c\DBPort=3306' /etc/zabbix/zabbix_server.conf

RUN service apache2 restart && service zabbix-server restart
ENTRYPOINT service apache2 start && service mysql start && service zabbix-server start && bash


#commands to run
#sudo docker run -d -p 8007:8081 nexuscon
