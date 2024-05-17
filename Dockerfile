FROM node:20 as web-builder
WORKDIR /app

# get dependencies
COPY obsidian-sync-share-web/package*.json .
RUN yarn install

# build web
COPY obsidian-sync-share-web/. .
RUN yarn run build

FROM azul/zulu-openjdk-alpine:17-latest as server-builder
WORKDIR /app

COPY .mvn .mvn
COPY pom.xml mvnw .

# make executable
RUN chmod +x mvnw

# get dependencies
RUN ./mvnw -B dependency:go-offline 

# build server
COPY src src
COPY --from=web-builder /app/dist src/main/resources/static
RUN ./mvnw package

# runner
FROM azul/zulu-openjdk-alpine:17-latest
WORKDIR /app

# copy jar file
COPY --from=server-builder /app/target/*.jar ./obsidian-sync-share-server.jar

# set env
ENV JAVA_OPTS=""

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar obsidian-sync-share-server.jar"]