# Blog Mongo Docker

## Objectif
Créer une image Docker MongoDB personnalisée qui initialise automatiquement une base `blog_db` avec une collection `posts`, un validateur JSON Schema et des données de test.

## Fichiers
- Dockerfile
- scripts/init-blog.js
- check-status.sh
- .env.example
- README.md

## Build
docker build -t blog-mongo:1.0.0 .

## Run
docker run -d --name blog_mongo --env-file .env -p 27017:27017 blog-mongo:1.0.0

## Vérification
./check-status.sh

## Test Mongo
docker exec -it blog_mongo mongosh -u admin -p VOTRE_MDP --authenticationDatabase admin

Puis dans mongosh :
use blog_db
db.posts.find().pretty()

## Docker Hub
Image publique : matias06/blog-mongo:1.0.0  
Lien : https://hub.docker.com/r/matias06/blog-mongo