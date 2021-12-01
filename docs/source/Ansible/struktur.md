Die grundlegende Struktur des Playbooks ist wie folgt:

```
$ tree
.
|-- README.md
|-- ansible-command.sh
|-- ansible-testing.sh
|-- group_vars
|-- hosts
|-- roles
|   |-- apt				#The apt role, as an example for a role
|   |   |-- files
|   |   |-- tasks			#Directory containing tasks
|   |   |   |-- main.yml		#Task file, in this case includes more
|   |   |   `-- other_yml
|   |   |       `-- apt.yml		#Task file
|-- site.yml
```

Das Repository zum Playbook enthÃlt ein Verzeichnis fÃr Variablen und ein Verzeichnis fÃ¼r Rolle.

Jeder der Rollen enthÃlt zu einer bestimmten Thematik zusammengefasste Tasks. So enthÃlt die Rolle `apt` zum Beispiel Tasks zur Configuration von `apt` und `unattended-upgrades`.
