# Use official Tomcat 9 image as base
FROM tomcat:9

# Maintainer information
LABEL maintainer="vinod20010330@gmail.com"

# Copy your Java project (WAR file) into the webapps directory of Tomcat
COPY target/java-project.war /usr/local/tomcat/webapps/

# Optionally, you can expose Tomcat's default port (8080)
EXPOSE 8080

# Command to run Tomcat
CMD ["catalina.sh", "run"]

