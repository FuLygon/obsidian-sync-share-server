# obsidian-sync-share-server

This fork mainly use for building Obsidian Sync Share Server with my forked [Obsidian Sync Share Web](https://github.com/FuLygon/obsidian-sync-share-web).

Added Actions workflow to automatically build server as Github package.

### Basic Usage

- `docker run`
```
docker volume create obsidian-sync-share-data

docker run -d --name obsidian-sync-share-server -p 80:8080 -v obsidian-sync-share-data:/app/user_store ghcr.io/fulygon/obsidian-sync-share-server:latest
```

- `docker-compose.yaml`
```
services:
  obsidian-sync-share-server:
    image: ghcr.io/fulygon/obsidian-sync-share-server:latest
    container_name: obsidian-sync-share-server
    volumes:
      - obsidian-sync-share-data:/app/user_store
    ports:
      - 80:8080

volumes:
  obsidian-sync-share-data:
```

### Advanced Usage
Please refer to the original documentation: [Alt-er/obsidian-sync-share](https://github.com/Alt-er/obsidian-sync-share)

