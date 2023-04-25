### words ###
FROM maven:3.6.3-jdk-14 as backend
WORKDIR /backend
COPY . . 
RUN mvn verify

#FROM openjdk:11.0.11-jre-slim
FROM openjdk:14-jdk-alpine
WORKDIR /home/backend
COPY --from=backend /backend/target ./target
EXPOSE 8080
RUN adduser -D user
USER user
CMD [ "java", "-jar", "/home/backend/target/words.jar" ]
#CMD [ "java", "-jar" ]