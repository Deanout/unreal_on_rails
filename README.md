# README

## Docker Run Command
Remember to sub out your master key for mine below.
```
docker build -t app . && docker volume create app-storage && docker run --rm -it -v app-storage:/rails/storage -p 3000:3000 --env RAILS_MASTER_KEY=9b48c2b5e792ddb6a97d32663e004407 app
```