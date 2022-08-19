#!/usr/bin/env bash

set -e

cd $1

CONFIGURATIONS=$(find ~+ -type f -name 'properties.ini' -exec dirname -z "{}" \; | sed -z 's/$/\n/')

mkdir -p ~/build

for CONF in $CONFIGURATIONS; do
    CONF_FOLDER=$(basename ${CONF})
    echo "Creating dir build/${CONF_FOLDER}"

    mkdir -p ~/build/${CONF_FOLDER}
done

cd ..