FROM ubuntu:yakkety
MAINTAINER Sam

RUN apt-get update -y
RUN apt-get install -y wget

#download and install java
RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.tar.gz
RUN tar -zxf jdk-8u5-linux-x64.tar.gz -C /opt

#update java
RUN update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_05/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_05/bin/javac 100
RUN java -version
