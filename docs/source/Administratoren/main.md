# Administrator*innen

## Hinzufügen von Administrator*innen

Neue Administrator*innen werden in `chat-darc-de-synapse/group_vars/all/users.yml` der Liste hinzugfügt hunzugefügt.

Für den SSH-Zugriff werden die Fingerprints der Public Keys in `chat-darc-de-synapse/roles/ensure_system_settings/files/ssh_pub_keys/` abgelegt. Dabei muss das Key-File nach dem Schema `username.pub` benannt werden. In diesem File können weitere Fingerprints hinterlegt werden. Dabei wird ein Key pro Zeile hinterlegt.

Die Zugänge stehen nach dem nächsten Ausrollen des Playbooks zur Verfügung.

## Entfernen von Administrator*innen

Administrator*innen werden entfernt indem der entsprechende Eintrag in `chat-darc-de-synapse/group_vars/all/users.yml` entfernt, das entsprechende Key-File in `chat-darc-de-synapse/roles/ensure_system_settings/files/ssh_pub_keys/` gelöscht und der entsprechende Account mit `deluser` gelöscht wird.
