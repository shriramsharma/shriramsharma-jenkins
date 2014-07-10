FROM shriramsharma/basedocker
MAINTAINER Shriram Sharma "shriram.sharma22@gmail.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get -y dist-upgrade
RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java

RUN apt-get update
# Accept the Oracle Java license
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
# Install Oracle Java
RUN apt-get install -y oracle-java7-installer

RUN apt-get install -q -y ant
RUN apt-get install -q -y cvs
RUN apt-get install -q -y maven
RUN apt-get install -q -y wget
RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
RUN mkdir /opt/jenkins
RUN echo "export JENKINS_HOME=/opt/jenkins" >> /etc/bash.bashrc
RUN mv jenkins.war /opt/jenkins/

EXPOSE 8080
