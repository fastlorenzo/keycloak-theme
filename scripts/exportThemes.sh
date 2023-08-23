#!/bin/bash

BRANCH="22.0.1"
SUBDIR="themes/src/main/resources/theme"
DEST="./themes/keycloak-provided-themes"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo ${DIR}

# Remove the destination directory if it exists
rm -rf ${DIR}/../${DEST}

# Download the repository zip file
# curl -L "https://github.com/keycloak/keycloak/archive/refs/tags/$BRANCH.zip" -o "$BRANCH.zip"

# Unzip only the subdirectory
unzip -q "$BRANCH.zip" "keycloak-${BRANCH}/${SUBDIR}/*" -d "keycloak-$BRANCH"

# Move the subdirectory to your desired location
mkdir -p $DEST
mv "keycloak-${BRANCH}/keycloak-$BRANCH/$SUBDIR"/* $DEST

# Clean up
rm -rf "keycloak-${BRANCH}"
rm "$BRANCH.zip"

# docker cp $jar $(docker ps | grep keycloak_dev_keycloak_1 | cut -d' ' -f1):/opt/keycloak/themes ${DIR}/../themes/keycloak-provided-themes
