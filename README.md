# obsidian-sync-share-server

Sync and share your notes, Back-end projects



# dev

Standard springboot project, import the idea can be started, does not depend on the database


# front-end

Please compile the front-end project and place it in `src/main/resources/static/`


# docker history
```shell
docker build -t obsidian-sync-share-server:1.1.7 .

docker login

docker tag obsidian-sync-share-server:1.1.7 alterzz/obsidian-sync-share-server:1.1.7

docker tag obsidian-sync-share-server:1.1.7 alterzz/obsidian-sync-share-server:latest

docker push alterzz/obsidian-sync-share-server:1.1.7

docker push alterzz/obsidian-sync-share-server:latest

```


