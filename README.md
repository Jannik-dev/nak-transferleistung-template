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
3. Eine bib Datei im Ordner erstellen
4. Markdown files im Ordner anlegen
5. Eine yaml Datei für styles der TL anlegen 
6. Eine properties.ini Datei anlegen und die Werte anpassen

## Eine Transferleistung bauen

Option A) Einen Commit erstellen und pushen

Du findest die Dateien dann unter Actions, den Commit auswählen und output herunterladen

Option B) lokal build.sh ausführen

Du findest die Dateien dann unter dem Ordner build
