#!/bin/bash
# Stop ci-keycloak containers
docker stop $(docker ps | grep keycloak_dev_keycloak_1 | cut -d' ' -f1) &&
docker stop $(docker ps | grep keycloak_dev_postgres_1 | cut -d' ' -f1)
