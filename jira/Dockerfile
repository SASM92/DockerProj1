FROM base
MAINTAINER Sam

#change directory
WORKDIR /opt/

#download Jira
RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.2.4-x64.bin

RUN chmod a+x atlassian-jira-software-7.2.4-x64.bin

RUN apt-get install git -y

#download varfile
RUN git clone https://github.com/SASM92/DockerProj1.git

#run
RUN ./atlassian-jira-software-7.2.4-x64.bin -q -varfile DockerProj1/files/response.varfile

WORKDIR /opt/atlassian/jira/bin
CMD ./start-jira.sh && tail -F /var/lib/jira/error.log

#commands to run
#sudo docker run -d -p 8006:8082 jiracon
