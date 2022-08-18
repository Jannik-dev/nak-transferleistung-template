#!/usr/bin/env bash

COVER="titlepage.pdf"
#   ^  specifies the name of the titlepage (has to be a pdf)

ABBREVIATIONS_FILE="abbreviations"
#   ^  specifies the name of the abbreviations file (has to be json)

MD_FILES=""
#   ^  specifies the order of the markdown files (seperate them by spaces)

STYLES="style_de_arial.yaml style_de_tnr.yaml style_en_arial.yaml style_en_tnr.yaml"
#   ^  specifies the styles to use





CONF_COVER="${COVER:-titlepage.pdf}"
CONF_ABBREVIATIONS_FILE="${ABBREVIATIONS_FILE:-abbreviations}"
CONF_MD_FILES="${MD_FILES:-*.md}"
CONF_STYLES="${STYLES:-style_de_arial.yaml style_de_tnr.yaml style_en_arial.yaml style_en_tnr.yaml}"