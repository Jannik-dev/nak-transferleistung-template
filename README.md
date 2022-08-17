# NAK-Transferleistung-Template

Mit diesem Template könnt ihr Transferleistungen mit Markdown schreiben. Dank der GitHub Actions müsst ihr euch keine Gedanken über die PDF Generierung und dem hinzufügen des Deckblattes machen. 

### Note:
Es sollte bei der Nutzung neue Branches für die Markdown Dateien angelegt werden, damit LanguageTool die Rechtschreibung bei einer Pull request überprüfen kann.

## Aktuellste Dateien
Templates:

https://moodle2.nordakademie.de/course/view.php?id=1584&section=4

Style - Merkblatt Transferleistungen (Seite 4):  

https://moodle2.nordakademie.de/course/view.php?id=1584&section=1

## Neue Transferleistung erstellen

1. Einen neuen Ordner anlegen
2. Eine Titelseite aus dem templates Ordner in den Ordner kopieren
3. Datei cites.bib im Ordner erstellen
4. Markdown files im Ordner anlegen
5. Einen neuen build job unter .github/workflows/ anlegen
6. Die env Variablen im build job anpassen
