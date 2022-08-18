#!/usr/bin/env bash

function generateBibPage() {
    echo "\newpage" >> bib.md
    echo "# ${BIB_TITLE} {-}" >> bib.md
    echo "\leftskip=2em" >> bib.md
    echo "\parindent=-2em" >> bib.md
    echo "Build PDF for ${CONF_FOLDER} with ${STYLE}"
}

CONFIGURATIONS=$(find ~+ -type f -name 'config.ini' -exec dirname -z "{}" \; | sed -z 's/$/\n/')

for CONF in $CONFIGURATIONS; do
    CONF_FOLDER=$(basename ${CONF})
    CONF_COVER=$(sed -n 's/COVER=//p' config.ini)
    CONF_ABBREVIATIONS_FILE=$(sed -n 's/ABBREVIATIONS_FILE=//p' config.ini)
    CONF_MD_FILES=${(sed -n 's/MD_FILES=//p' config.ini):-*.md}
    CONF_STYLES=$(sed -n 's/STYLES=//p' config.ini)

    for STYLE in ${CONF_STYLES}; do
        echo ${STYLE}

        cd $CONF
        if echo ${STYLE} | grep de-DE; then 
            $BIB_TITLE="Literaturverzeichnis"
        else 
            $BIB_TITLE="Bibliography"
        fi

        generateBibPage

        echo "Build PDF for ${CONF_FOLDER} with ${STYLE}"
        pandoc --from markdown --to=pdf --pdf-engine=xelatex --embed-resources --standalone --table-of-contents --citeproc --abbreviations=${CONF_ABBREVIATIONS_FILE} --number-sections --metadata-file ../${STYLE} ${CONF_MD_FILES} bib.md -o ${STYLE}.pdf

        echo "Combine PDF for ${CONF_FOLDER} with ${STYLE}"
        pdftk ${CONF_COVER} ${STYLE}.pdf cat output ../build/${CONF_FOLDER}/${CONF_FOLDER}_${STYLE}.pdf
        cd ..
    done
done