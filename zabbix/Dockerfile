FROM base
MAINTAINER Sam

#change directory
WORKDIR /opt/

RUN apt-get install git -y
RUN apt-get install tree

#download AMP
RUN apt-get update
RUN apt-get install apache2 -y

#input for terminal
RUN echo 'mysql-server mysql-server/root_password password your_password' | debconf-set-selections 
RUN echo 'mysql-server mysql-server/root_password_again password your_password' | debconf-set-selections
RUN apt-get install mysql-server -y 
RUN apt-get install php7.0 php7.0-cli php7.0-common php7.0-mysql -y

#adding zabbix apt repository
RUN wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+xenial_all.deb
RUN dpkg -i zabbix-release_3.2-1+xenial_all.deb
RUN apt-get update

#install zabbix server
RUN apt-get install -q zabbix-server-mysql zabbix-frontend-php -y

#clone repo
RUN git clone https://github.com/SASM92/DockerProj1.git

#run varfile
WORKDIR DockerProj1/files/
RUN tree
RUN chmod a+x db.sh
CMD ./db.sh
 









#commands to run
#sudo docker run -d -p 8007:8081 nexuscon
