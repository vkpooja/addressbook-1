from tomcat:8.5.72-jdk17-openjdk-slim
add target/addressbook.war /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]
