FROM ubuntu

RUN apt-get update
RUN apt-get install -y maven openjdk-8-jdk
RUN mvn verify

CMD ["mvn","verify"]
CMD ["java","-Xmx8m","-Xms8m","-jar","./target/words.jar"]

EXPOSE 8080