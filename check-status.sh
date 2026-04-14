#!/bin/bash

source .env

echo "Vérification du conteneur..."

USER_IN_CONTAINER=$(docker exec "$CONTAINER_NAME" whoami)

if [ "$USER_IN_CONTAINER" = "root" ]; then
  echo "Erreur : le conteneur tourne en root"
  exit 1
fi

POST_COUNT=$(docker exec "$CONTAINER_NAME" mongosh \
  -u "$MONGO_INITDB_ROOT_USERNAME" \
  -p "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --quiet \
  --eval "db.getSiblingDB('$MONGO_DB').posts.countDocuments()")

if [ $? -ne 0 ]; then
  echo "Erreur : MongoDB ne répond pas"
  exit 1
fi

echo "Succès : MongoDB répond"
echo "Base testée : $MONGO_DB"
echo "Nombre de documents dans posts : $POST_COUNT"
echo "Utilisateur du conteneur : $USER_IN_CONTAINER"
