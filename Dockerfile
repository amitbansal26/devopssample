FROM gradle:7.5.1-jdk17-alpine as builder

ENV APP_HOME=/home/gradle/src

WORKDIR $APP_HOME

COPY --chown=gradle:gradle . $APP_HOME
WORKDIR $APP_HOME

RUN gradle build --info --no-daemon

FROM eclipse-temurin:17-jre-jammy

COPY --from=builder /home/gradle/src/build/libs/devopssample-0.0.1-SNAPSHOT.jar /app.jar
EXPOSE 8080
CMD ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
