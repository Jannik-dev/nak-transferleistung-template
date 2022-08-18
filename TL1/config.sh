#!/usr/bin/env bash

$COVER="titlepage.pdf"                      # the name of the titlepage (has to be a pdf)
$ABBREVIATIONS_FILE="abbreviations"   # the name of the abbreviations file (has to be json)

$MD_FILES="0_example.md"
#   ^  specifies the order of the markdown files (seperate them by spaces)

$STYLES="style_de_arial.yaml style_de_tnr.yaml style_en_arial.yaml style_en_tnr.yaml"    
# you should only use one language in this job - choose one (if you want both than create a new folder)






SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "{folder}={$SCRIPT_DIR}" >> $GITHUB_ENV

echo "{titlepage}={$COVER}" >> $GITHUB_ENV
echo "{abbreviations_file}={$ABBREVIATIONS_FILE}" >> $GITHUB_ENV
echo "{md_files}={$MD_FILES}" >> $GITHUB_ENV
echo "{styles}={$STYLES}" >> $GITHUB_ENV