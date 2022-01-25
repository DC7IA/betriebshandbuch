Die folgende Aufstellung zeigt eine Übersicht der genutzten Server und deren Funktion innerhalb der Matrix-Plattform.

### Matrix-Server

Auf dem Matrix-Server läuft die Software `synapse` welche den eigentlichen Matrix-Server bereitstellt.

Außerdem wird auf diesem Server die Weboberfläche Element bereitgestellt.

Diesen Server gibt es als Staging-System und auch als Produktiv-System.

### Backup-Server

Auf dem Backup-Server werden die Backups des Matrix-Server mittels `restic` abgelegt.
