#!/usr/bin/env bash

set -e

cd $1

CONFIGURATIONS=$(find ~+ -type f -name 'properties.ini' -exec dirname -z "{}" \; | sed -z 's/$/\n/')

sudo mkdir -p build
cd build

for CONF in $CONFIGURATIONS; do
    CONF_FOLDER=$(basename ${CONF})
    echo "Creating dir build/${CONF_FOLDER}"

    sudo mkdir -p ${CONF_FOLDER}
done

cd ..