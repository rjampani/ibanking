FROM tomcat:9.0.41-jdk8-openjdk
WORKDIR /usr/local/tomcat
COPY tagent/ibankin.war webapps/ibanking.war