#!/usr/bin/env bash
cd $1
mkdir build
CONFIGURATIONS=$(find ~+ -type f -name 'properties.ini' -exec dirname -z "{}" \; | sed -z 's/$/\n/')
cd build
for CONF in $CONFIGURATIONS; do
    CONF_FOLDER=$(basename ${CONF})
    echo "Creating dir build/${CONF_FOLDER}"

    mkdir ${CONF_FOLDER}
done
cd ..