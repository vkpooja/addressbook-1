from openjdk
run yum install tomcat -y
add /var/lib/jenkins/workspace/package/target/addressbook.war /usr/java/openjdk-8
EXPOSE 8080
CMD ["jshell"]