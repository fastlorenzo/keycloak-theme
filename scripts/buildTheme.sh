#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo ${DIR}
cd ${DIR}/..

# Clean the build folder
rm -rf build

# Create a new build folder
mkdir -p build/{META-INF,theme}

# Copy the theme files to the build folder
cp -r themes/befritco build/theme

# Add the keacloak-themes.json file to the META-INF folder
for component in $(ls themes/befritco); do
    echo """
    {
        \"themes\": [{
            \"name\": \"befritco\",
            \"types\": [\"login\", \"account\", \"admin\", \"welcome\"]
        }]
    }
    """ >build/META-INF/keycloak-themes.json
done

cd build
zip -r ../befritco-theme.jar *
