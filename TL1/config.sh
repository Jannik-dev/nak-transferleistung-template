#!/usr/bin/env bash

$COVER="titlepage.pdf"
#   ^  specifies the name of the titlepage (has to be a pdf)

$ABBREVIATIONS_FILE="abbreviations"
#   ^  specifies the name of the abbreviations file (has to be json)

$MD_FILES=""
#   ^  specifies the order of the markdown files (seperate them by spaces)

$STYLES="style_de_arial.yaml style_de_tnr.yaml style_en_arial.yaml style_en_tnr.yaml"
#   ^  specifies the styles to use





NN_COVER="${COVER:-titlepage.pdf}"
NN_ABBREVIATIONS_FILE="${ABBREVIATIONS_FILE:-abbreviations}"
NN_MD_FILES="${MD_FILES:-*.md}"
NN_STYLES="${STYLES:-style_de_arial.yaml style_de_tnr.yaml style_en_arial.yaml style_en_tnr.yaml}"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "{folder}={$SCRIPT_DIR}" >> $GITHUB_ENV

echo "{titlepage}={$NN_COVER}" >> $GITHUB_ENV
echo "{abbreviations_file}={$NN_ABBREVIATIONS_FILE}" >> $GITHUB_ENV
echo "{md_files}={$NN_MD_FILES}" >> $GITHUB_ENV
echo "{styles}={$NN_STYLES}" >> $GITHUB_ENV