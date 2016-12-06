FROM base
MAINTAINER Sam

#change directory
WORKDIR /opt/
RUN apt-get install tree -y
#download Nexus
RUN wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz

RUN tar -xvzf latest-unix.tar.gz
RUN tree

WORKDIR /opt/nexus-3.1.0-04/bin
RUN tree
CMD ./nexus run 

#commands to run
#sudo docker run -d -p 8007:8081 nexuscon
