# Matrix-Betriebshandbuch

Dieses Betriebshandbuch besteht aus ``.rst/.md`` Dateien, die in den Unterordnern von ``docs/source/`` zu finden sind.  

Das vollständig gerenderte Betriebshandbuch ist unter der folgenden Adresse erreichbar: 
> http://127.0.0.1:13000/

## Verzeichnisstruktur 

```bash
.
├── README.md                   <- diese Datei
├── Dockerfile                  <- das Dockerfile
├── docker-compose.yml          <- Compose-file für automatischen Build und Publish des Containers
├── test-changes-locally.sh     <- Script welches mit dem Dockerfile einen Container baut und darin das Handbuch baut
└── docs
    ├── Makefile                <- Makefile von Sphinx
    ├── build                   <- Enthält das Ergebnis und die Files die beim Build entstehen, leer und nicht versionskontrolliert
    └── source                  <- Enthält die Quellen für das Handbuch, aufgeteilt in Verzeichnisse für einzelne Kapitel
        ├── Allgemein           <- Eines der Kapitel
        ├── pictures            <- Die Bilder für das Handbuch
        ├── conf.py             <- Konfigurationsdatei, enthält unter anderem Einstellungen für das HTML-Theme
        ├── index.rst           <- Index-Datei für das Project, darin werden die einzelnen Kapitel inkludiert
        ├── pictures            <- Bilder für das Projekt
        └── darc-logo.png       <- DARC-Logo für Startseite der Dokumentation
```

## Design Guide

Die Kapitelstruktur wird durch die `index.rst` Datei im *source* Verzeichnis festgelegt, die Nummerierung der Kapitel erfolgt automatisch.

Kommt ein neues Thema hinzu sollte dies, soweit möglich, einem bereits bestehenden Kapitel zuordnen.

Jedem Kapitel liegt eine `main.md` Datei zugrunde, in dieser können die weiteren Unterkapitel inkludiert werden, wie im folgenden Beispiel:

-------
\# Kapitel

\## Unterkapitel 1  
\`\`\`{include} unterkapitel1&#46;md  
\`\`\`

\## Unterkapitel 2  
\`\`\`{include} unterkapitel2&#46;md  
\`\`\`

\## Großes Unterkapitel 3  
\`\`\`{include} unterkapitel3_1&#46;md  
\`\`\`

\`\`\`{include} unterkapitel3_1&#46;md  
\`\`\`

-------

Im Falle eines zu inkludierenden Kapitels mit vielen weiteren Includes, empfiehlt es sich, diese Dateien in einem eigenen Ordner zu
sammeln und im Include-Statement den (relativen) Pfad zu übergeben.

## Hinweise/Warnungen

Um bestimmte Punkte farblich besonders hervorzuheben, können die folgenden *admonition* Klassen verwendet werden:

* note
* danger
* hint
* warning

![](.repository/pictures/example-admonitions.png)

Die *admonitions* können folgendermaßen in Markdown-Dateien eingebunden werden:

```
:::{admonition} Anmerkung
:class: note
Hier steht eine Anmerkung.
:::

:::{admonition} Gefahr
:class: danger
Hier lauert Gefahr.
:::

:::{admonition} Hinweis
:class: hint
Hier steht ein Hinweis.
:::

:::{admonition} Warnung
:class: warning
Hier steht eine Warnung.
:::
```
> Die *admonitions* werden im gängigen Markdown Previewern (z.B. in VSCode) nicht korrekt gerendert, das ist eine Sphinx-Spezialität.

## RST-Syntax

Folgendes ist eine kurze Übersicht über die RST-Syntax, sie dient hier nur der Vollständigkeit.

Die weitere Syntax kann zum Beispiel diesem Cheatsheet entnommen werden: https://docutils.sourceforge.io/docs/user/rst/quickref.html

## Versionierung

Bei der Versionierung wird zwischen minor und major releases unterschieden, wobei 0.9 ein major release, 0.9.1 ein minor release ist.
Die Version kann in docks/source/conf.py festgelegt werden.
Das aktuelle Datunm kann indocs/source/index.rst festgelegt werden.

## Web-Version: Rendern und Update automatisiert

Der Docker Container wird über eine CI/CD Pipeline mithilfe eines Gitlab Runners bei jedem Push in das Remote Repository automatisch neu gebaut, ein manueller Rebuild ist normalerweise nicht notwendig.  
Ein erfolgreicher/fehlerhafter Build ist auf der Übersichtsseite des Repositories zu sehen.

## Web-Version: Rendern manuell

Um das Web-basiertes Handbuch zu rendern wird *docker-compose* verwendet.  
Nachdem das Repository geklont wurde, kann mit dem Kommando ``docker-compose up -d --build`` der Container gestartet werden, der anschließend auf dem Port 13000 den Service bereitstellt.

## Web-Version: Persönliche Version

Um einen eigenen Container zu deployen, um sich seine gemachten Änderungen im Vorfeld anschauen zu können, kann das Skript ``tools/test-changes-locally.sh`` verwendet werden.  
Das Skript erstellt ein eigenes Docker-Image und erstellt daraus einen (personalisierten) Container:

```bash
[user@host darc-matrix-betriebshandbuch]$ bash tools/test-changes-locally.sh 
Removing running container:
betriebshandbuch-user
Building new image:
Sending build context to Docker daemon  10.48MB
Step 1/8 : FROM python:slim
(...)
View your copy at:
>> http://127.0.0.1:13030 <<
```

## PDF-Version: Rendern

Die PDF-Version des Betriebshandbuchs kann über ein Wrapper-Skript generiert werden:

```bash
[user@host darc-matrix-betriebshandbuch]$ ./create-pdf.sh 
Create PDF:
Running Sphinx v4.1.2
loading translations [de]... done
making output directory... done
[...]
Writing output: /var/www/html/pdf/Matrix-Betriebshandbuch.pdf
done
build succeeded, 143 warnings.
The PDF document is available at:
>> http://127.0.0.1:13000/pdf/Matrix-Betriebshandbuch.pdf <<
```

Das Betriebshandbuch im PDF Format ist über den angegebenen Link im Browser abrufbar nachdem ein dedizierter Container mit dem folgenden script gestartet wurde:
```bash
bash tools/create-pdf.sh
```
> http://127.0.0.1:13000/pdf/Matrix-Betriebshandbuch.pdf


