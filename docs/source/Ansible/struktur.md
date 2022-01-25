Die grundlegende Struktur des Playbooks ist wie folgt:

```
├── README.md
├── ansible-deploy-production.sh                                # Dieses Script rollt das Playbook auf dem Produktiv-System aus
├── ansible-deploy-staging.sh                                   # Dieses Script rollt das Playbook auf dem Staging-System aus
├── ansible-test-production.sh                                  # Dieses Script simuliert Änderungen auf dem Produktiv-System ohne schreibend darauf zu wirken
├── ansible-test-staging.sh                                     # Dieses Script simuliert Änderungen auf dem Staging-System ohne schreibend darauf zu wirken
├── ansible.cfg                                                 # Ansible-Konfiguration
├── check-repository.sh
├── collections
│   └── requirements.yml
├── group_vars                                                  # Verzeichnis für Variablen-Definitionen
│   ├── all
│   │   ├── firewall-ports.yml                                  # Liste der zu öffnenden Ports
│   │   ├── matrix-vars.yml                                     # Variablen für Matrix
│   │   ├── passwords.yml                                       # Ansible Vault File mit Secrets
│   │   ├── restic.yml                                          # Variablen für restic
│   │   └── users.yml                                           # Definition von Usern
│   └── monitoring
│       ├── grafana.yml
│       └── prometheus.yml
├── inventory-production.yml                                    # Inventory für da Produktiv-System
├── inventory-staging.yml                                       # Inventory für das Staging-System
├── ressources                                                  # Weitere Files welche beim Aufsetzen des Servers nützlich sind, aber nicht Teil des Playbooks sind
│   ├── Datenschutz.md
│   ├── README.md
│   └── server
├── roles                                                       # Verzeichnis für die Rollen
│   ├── matrix_synapse                                          # Rolle für matrix-synapse als Beispiel
│   │   ├── README.md
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── files
│   │   │   ├── remove_external_id_from_deleted_accounts.sh
│   │   │   └── sso.py
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── meta
│   │   │   └── main.yml
│   │   ├── molecule
│   │   │   └── default
│   │   │       ├── Dockerfile.j2
│   │   │       ├── converge.yml
│   │   │       ├── molecule.yml
│   │   │       └── verify.yml
│   │   ├── tasks
│   │   │   ├── deleted_user_accounts_removal_script.yml
│   │   │   ├── main.yml
│   │   │   ├── matrix_synapse_config.yml
│   │   │   ├── postgres.yml
│   │   │   └── repository.yml
│   │   ├── templates
│   │   │   ├── homeserver.yaml.j2
│   │   │   ├── log.yaml.j2
│   │   │   └── server_name.yaml.j2
│   │   └── tests
│   │       ├── inventory
│   │       └── test.yml
├── site.yml                                                    # Enthält Konfiguration welche sich per Host unterscheidet
└── tmp                                                         # Enthält bei Ausführung des Playbooks temporäre Dateien
```

Aus Gründen der Übersichtlichkeit wird hier lediglich beispielhaft die Rolle `matrix-synapse` aufgeführt.

Das Repository zum Playbook enthält ein Verzeichnis für Variablen und ein Verzeichnis für Rollen.

Jeder der Rollen enthält zu einer bestimmten Thematik zusammengefasste Tasks. So enthält die Rolle `apt` zum Beispiel Tasks zur Configuration von `apt` und `unattended-upgrades`.
