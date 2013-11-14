FROM ubuntu
MAINTAINER Shriram Sharma "shriram.sharma22@gmail.com"

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -q -y openjdk-7-jre-headless
RUN apt-get install -q -y ssh
RUN apt-get install -q -y wget
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /root/jenkins.war

EXPOSE 8080
EXPOSE 22
CMD ["java", "-jar", "/root/jenkins.war"]
