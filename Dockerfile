FROM tomcat:9.0.41-jdk8-openjdk
COPY target/ibanking.war webapps/ibanking.war
