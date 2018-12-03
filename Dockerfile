FROM tomcat:8

MAINTAINER Kuljeet Verma
RUN wget -O /usr/local/tomcat/webapps/demosampleapplication.war http://localhost:8081/artifactory/generic-local/com/nagarro/jenkins/kuljeetverma/devopssampleapplication.war

EXPOSE 8080
EXPOSE 8081

CMD /usr/local/tomcat/bin/catalina.sh run
