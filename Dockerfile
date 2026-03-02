FROM tomcat:8.5-jdk8-temurin

# Install curl
RUN apt-get update && apt-get install -y curl

# Nexus details
ENV NEXUS_URL=http://18.218.72.148:8081
ENV ARTIFACT_PATH=/repository/hiring-app/in/javahome/hiring/0.1/hiring-0.1.war

# Download WAR from Nexus
RUN curl -o /usr/local/tomcat/webapps/ROOT.war \
    $NEXUS_URL$ARTIFACT_PATH

EXPOSE 8080

CMD ["catalina.sh", "run"]
