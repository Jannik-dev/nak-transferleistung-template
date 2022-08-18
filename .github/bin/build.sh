#!/usr/bin/env bash

cd $1

function generateBibPage() {
    echo "# ${BIB_TITLE} {-}" > bib.md
    echo "\leftskip=2em" >> bib.md
    echo "\parindent=-2em" >> bib.md
}

CONFIGURATIONS=$(find ~+ -type f -name 'properties.ini' -exec dirname -z "{}" \; | sed -z 's/$/\n/')

for CONF in $CONFIGURATIONS; do
    CONF_FOLDER=$(basename ${CONF})
    cd $CONF

    CONF_COVER=$(sed -n 's/COVER=//p' properties.ini)
    CONF_ABBREVIATIONS_FILE=$(sed -n 's/ABBREVIATIONS_FILE=//p' properties.ini)
    CONF_MD_FILES=$(sed -n 's/MD_FILES=//p' properties.ini)
    CONF_MD_FILES=${CONF_MD_FILES:-*.md}
    CONF_STYLES=$(sed -n 's/STYLES=//p' properties.ini)

    for STYLE in ${CONF_STYLES}; do

        if grep -q "de-DE" ../${STYLE}; then 
            BIB_TITLE="Literaturverzeichnis"
        else 
            BIB_TITLE="Bibliography"
        fi

        generateBibPage

        echo "Build PDF for ${CONF_FOLDER} with ${STYLE}"
        pandoc --from markdown --to=pdf --pdf-engine=xelatex --embed-resources --standalone --table-of-contents --citeproc --abbreviations=${CONF_ABBREVIATIONS_FILE} --number-sections --metadata-file ../${STYLE} ${CONF_MD_FILES} bib.md -o ${STYLE}.pdf

        echo "Combine PDF for ${CONF_FOLDER} with ${STYLE}"
        pdftk ${CONF_COVER} ${STYLE}.pdf cat output ../build/${CONF_FOLDER}/${CONF_FOLDER}_${STYLE}.pdf
    done

    cd ..
done