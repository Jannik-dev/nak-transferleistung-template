#!/usr/bin/env bash

set -e

function generateBibPage() {
    echo "# ${BIB_TITLE} {-}" > ${HOME}/tmp/bib.md
    echo "\leftskip=2em" >> ${HOME}/tmp/bib.md
    echo "\parindent=-2em" >> ${HOME}/tmp/bib.md
}

function generateAbbrevPage() {
    echo "---" > ${HOME}/tmp/acr.md
    echo "title-meta: 'The title goes here'" >> ${HOME}/tmp/acr.md
    echo "..." >> ${HOME}/tmp/acr.md
    echo "# ${ACR_TITLE} {-}"  >> ${HOME}/tmp/acr.md
}

CONFIGURATIONS=$(find ~+ -type f -name 'properties.ini' -exec dirname -z "{}" \; | sed -z 's/$/\n/')

for CONF in $CONFIGURATIONS; do
    CONF_FOLDER=$(basename ${CONF})
    mkdir -p ${HOME}/tmp

    CONF_COVER=$(sed -n 's/COVER=//p' $CONF/properties.ini)
    CONF_ABBREVIATIONS_FILE=$(sed -n 's/ABBREVIATIONS_FILE=//p' $CONF/properties.ini)
    CONF_BIB_FILE=$(sed -n 's/BIB_FILE=//p' $CONF/properties.ini)
    CONF_MD_FILES=$(sed -n 's/MD_FILES=//p' $CONF/properties.ini)
    CONF_MD_FILES=${CONF_MD_FILES:-*.md}
    CONF_STYLES=$(sed -n 's/STYLES=//p' $CONF/properties.ini)

    for STYLE in ${CONF_STYLES}; do

        if grep -q "de-DE" ${STYLE}; then 
            BIB_TITLE="Literaturverzeichnis"
            ACR_TITLE="Abkürzungsverzeichnis"
        else 
            BIB_TITLE="Bibliography"
            ACR_TITLE="Acronyms"
        fi

        generateBibPage
        generateAbbrevPage

        echo "Build PDF for ${CONF_FOLDER} with ${STYLE}"
        cd $CONF_FOLDER
        pandoc --from markdown --to=pdf --pdf-engine=xelatex --embed-resources --standalone --table-of-contents --bibliography=${CONF_BIB_FILE} --citeproc --number-sections --metadata-file ../${STYLE} --filter pandoc-acro ${HOME}/tmp/acr.md ${CONF_MD_FILES} ${HOME}/tmp/bib.md -o ~/tmp/${STYLE}.pdf
        cd ..

        echo "Combine PDF for ${CONF_FOLDER} with ${STYLE}"
        pdftk $CONF/${CONF_COVER} ~/tmp/${STYLE}.pdf cat output ~/build/${CONF_FOLDER}/${CONF_FOLDER}_${STYLE}.pdf
    done
done