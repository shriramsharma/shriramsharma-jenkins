FROM ubuntu
MAINTAINER Shriram Sharma "shriram.sharma22@gmail.com"

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -q -y openjdk-6-jre
RUN apt-get install -q -y openjdk-6-jdk
RUN apt-get install -q -y vim
RUN apt-get install -q -y openssh-server
RUN apt-get install -q -y ant
RUN apt-get install -q -y cvs
RUN apt-get install -q -y maven
RUN apt-get install -q -y git
RUN mkdir /var/run/sshd
RUN echo 'root:docker' | chpasswd
RUN apt-get install -q -y wget
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /root/jenkins.war
RUN echo "export JENKINS_HOME=/root" >> /etc/bash.bashrc
RUN mkdir /opt/jenkins

EXPOSE 8080
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
