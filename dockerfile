from tomcat:8.5.72-jdk17-openjdk-buster
add target/addressbook.war /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]
