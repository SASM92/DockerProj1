FROM base
MAINTAINER Sam

#download key for jenkins and then add key with "apt-key add"
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -

#get debian library binary for jenkins and put it in a file
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

#install jenkins
RUN apt-get update -y
RUN apt-get install jenkins -y

#run
CMD service jenkins start && tail -F /var/log/jenkins/jenkins.log 

#commands to run
#sudo docker run -d -p 8086:8080 jenkinscon
