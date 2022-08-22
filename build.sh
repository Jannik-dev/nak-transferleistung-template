#!/usr/bin/env bash

set -e

docker start nakcontainer || docker run --name nakcontainer --detach -ti jnorden/nak-transferleistung-template:1.0.0
docker cp . nakcontainer:/nak/
rm -rf build/*
docker exec nakcontainer /bin/bash -c "cd /nak && bash bin/setup_pdf.sh && bash bin/build_pdf.sh"
docker cp nakcontainer:/tmp/build .
docker exec nakcontainer /bin/bash -c "rm -rf /tmp/acr.md /tmp/bib.md /tmp/build"
docker stop nakcontainer