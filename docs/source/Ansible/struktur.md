Die grundlegende Struktur des Playbooks ist wie folgt:

```
$ tree
.
|-- README.md
|-- ansible-command.sh			#Contains the command to apply the Ansible Playbook
|-- ansible-testing.sh			#Contains the command to run the Ansible Playbook in check mode
|-- group_vars				#Contains variables
|-- hosts				#Contains the IP address or TLD of the server
|-- roles				#Folder containing the Ansible roles
|   |-- apt				#The apt role, as an example for a role
|   |   |-- files			#Files for the apt role
|   |   |-- tasks			#Directory containing tasks
|   |   |   |-- main.yml		#Task file, in this case all other files in "other_yml" are included
|   |   |   `-- other_yml
|   |   |       `-- apt.yml		#Task file
`-- site.yml				#Configures what roles to apply and some after things
```

Das Repository zum Playbook enth√lt ein Verzeichnis f√r Variablen und ein Verzeichnis f√ºr Rolle.

Jeder der Rollen enth√lt zu einer bestimmten Thematik zusammengefasste Tasks. So enth√lt die Rolle `apt` zum Beispiel Tasks zur Configuration von `apt` und `unattended-upgrades`.
