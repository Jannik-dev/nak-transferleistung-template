#!/usr/bin/env bash

set -e

CONFIGURATIONS=$(find ~+ -type f -name 'properties.ini' -exec dirname -z "{}" \; | sed -z 's/$/\n/')

mkdir -p ~/build

for CONF in $CONFIGURATIONS; do
    CONF_FOLDER=$(basename ${CONF})
    echo "Creating dir build/${CONF_FOLDER}"

    mkdir -p /tmp/build/${CONF_FOLDER}
done