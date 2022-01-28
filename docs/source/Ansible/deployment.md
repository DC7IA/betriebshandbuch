---

Für das Deployment wird das entsprechende Script aufgerufen.

### Vorraussetzungen für ein erfolgreiches Deployment

Bevor das Playbook das erste Mal ausgeführt werden kann müssen diese Vorraussetzungen erfüllt sein:

- SSH Public Key in `/root/.ssh/id_ed25519` muss von beiden Systemen im Repository für die Hilfe-Seiten als leseberechtigt hinterlegt werden 
  - Falls kein Key existiert kann dieser wie folgt generiert werden: `ssh-keygen -t ed25519 -f /root/.ssh/id_ed25519`
  - Alternativ kann die Rolle `hugo` für die Hilfeseiten in `site.yml` erst einmal auskommentiert werden und die Hilfeseiten zu einem späteren Zeitpunkt ausgerollt werden
- Der Key für Ansible Vault muss vorliegen

### Deployment auf dem Staging-System

Zuerst wird sichergestellt, dass der aktuelle Branch `dev` ist. Entfernte Änderungen werden per `git pull` vom Repository geholt.

Zuerst werden die Änderungen simuliert. Hierbei werden keine schreibenden Änderungen vorgenommen, es wird lediglich angezeigt wie Dateien beim Deployment verändert würden.

`./ansible-test-staging.sh`

Wenn dabei keine Fehler auftreten kann im nächsten Schritt der Stand auf dem System ausgerollt werden: `./ansible-deploy-staging.sh`

### Deployment auf dem Produktiv-System

Nachdem ein Stand auf dem Staging-System erfolgreich ausgerollt wurde und keine Fehler festgestellt wurden, kann `dev` mit einem Merge in `main` übertragen werden und dieser Stand auch auf das Produktiv-System ausgerollt werden: `./ansible-deploy-staging.sh`
