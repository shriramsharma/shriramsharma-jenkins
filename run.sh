#!/bin/sh

/usr/sbin/sshd -D
java -jar /opt/jenkins/jenkins.war &
