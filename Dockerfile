FROM tomcat:8

MAINTAINER Kuljeet Verma
RUN wget -O /usr/local/tomcat/webapps/demosampleapplication.war http://192.168.56.101:8081/artifactory/generic-local/com/nagarro/jenkins/kuljeetverma/devopssampleapplication.war

EXPOSE 4000

CMD /usr/local/tomcat/bin/catalina.sh run
