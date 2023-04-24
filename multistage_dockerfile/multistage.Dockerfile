
#Observaciones: Cuando se ejecutan los Docker file por aparte tienen un peso de aproximadamente
#REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
#web          latest    4504511e7d74   29 seconds ago   847MB
#words        latest    b052dec367f7   3 minutes ago    856MB
#multistage   latest    8a24a4609884   2 hours ago      220MB  <---------
#db           latest    c5bdd45d8513   3 days ago       379MB


## Con multistage JDK
#@alejandrotrejo8779 ➜ .../intro-docker-202304-alejandrotrejo8779/repos/wordsmith/words (bc3889d) $ docker image ls -a
#REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
#multistage   latest    623098e4b610   13 minutes ago   345MB

##Con multistage JDK
#REPOSITORY   TAG       IMAGE ID       CREATED             SIZE
#multistage   latest    8a24a4609884   About an hour ago   220MB


### web ###
FROM golang as golang

COPY dispatcher.go .
COPY static static

RUN go build dispatcher.go

CMD ["./dispatcher"]

EXPOSE 80

### db ###
FROM postgres as postgres

COPY words.sql /docker-entrypoint-initdb.d

ENV POSTGRES_HOST_AUTH_METHOD=trust

### words ###
FROM maven:3.6.3-jdk-14 as backend
WORKDIR /backend
COPY . . 
RUN mvn verify

FROM openjdk:11.0.11-jre-slim
#FROM openjdk:14-jdk-alpine
WORKDIR /home/backend
#COPY --from=backend /backend/target ./target
#EXPOSE 8080
#RUN adduser -D user
#USER user
#CMD [ "java", "-jar", "/home/backend/target/words.jar" ]
CMD [ "java", "-jar" ]

