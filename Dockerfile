FROM tomcat:alpine
MAINTAINER DevopsQA
RUN wget -O /usr/local/tomcat/webapps/devopsforqa.war http://10.127.130.66:8040/artifactory/devopsforqaRA/com/nagarro/devops-tools/devops/demosampleapplication/1.0.0-SNAPSHOT/demosampleapplication-1.0.0-SNAPSHOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
