FROM openjdk:8
# ARG JAR_FILE=target/*.war

RUN apt update \
&& apt install maven -y

WORKDIR /app/hello-world
COPY . .
RUN mvn clean install spring-boot:repackage -Dmaven.test.skip=true
RUN mv /app/hello-world/target/*.war /app/hello-world/target/app.war

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/hello-world/app.war"]

# kubectl expose deployment.apps demo-image --port=9000 --name=gethost 
