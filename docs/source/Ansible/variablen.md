Im Verzeichnis `groups_vars/all` liegen diverse Dateien in welchen Variablen gesetzt werden:


:::{note}
Die folgenden Variablen enthalten einen historischen Stand zu dokumentatorischen Zwecken, dieser ist nicht notwendigerweise aktuell.
:::
```
$ ~/git/chat-darc-de-synapse (git)-[dev] % tree group_vars 
group_vars
├── all
│   ├── firewall-ports.yml
│   ├── hugo.yml
│   ├── matrix-vars.yml
│   ├── nginx.yml
│   ├── passwords.yml
│   └── users.yml
└── monitoring
    ├── grafana.yml
    └── prometheus.yml

2 directories, 8 files
```

Bei `passwords.yml` handelt es sich um eine mit Ansible Vault verschlüsselte Datei in welcher Variablen gesetzt werden welche Secrets enthalten. Alle anderen Variablen enthalten Klartext und sollen im Folgenden erläutert werden.

```
$ ~/git/chat-darc-de-synapse (git)-[dev] % cat group_vars/all/firewall-ports.yml
---

firewall_services:
  - ssh
  
firewall_ports:
  - 80/tcp #http
  - 443/tcp #https
  - 8448/tcp #matrix federation
```

In diesem File werden die offenen Ports der Firewall konfiguriert.

```
$ ~/git/chat-darc-de-synapse (git)-[dev] % cat group_vars/all/hugo.yml 
---

hugo_build_dir: "/root/hugo/build_dir"
```

Hier wird das Build-Directory für Hugo konfiguriert in welchem die Hilfe-Seiten gebaut werden um anschließend im Webserver-Verzeichnis platziert zu werden.

```
$ ~/git/chat-darc-de-synapse (git)-[dev] % cat group_vars/all/matrix-vars.yml 
---

matrix_db_user: "matrix_db_user"
matrix_db_name: "synapse-db"
matrix_element_web_version: "v1.10.1"

matrix_turn_servers: [ 
    "turns:turnserver.treff.darc.de:443?transport=tcp",
    "turns:turnserver.treff.darc.de:443?transport=udp",
    "turn:turnserver.treff.darc.de:3479?transport=tcp",
    "turn:turnserver.treff.darc.de:3479?transport=udp"
]

matrix_consent_id: "018a42bf292" # darc-chat-hilfe commit ID
```

Hier werden der Name der Datenbank und deren User, die auszurollende Versionsnummer von Element Web und die TURN-Server konfiguriert. Weiterhin ist eine ID der aktuellen Datenschutzerklärung erhalten. Eine Änderung wird alle Benutzer*innen zwingend der neuen Datenschutzerklärung zustimmen zu lassen um den Server weiterhin nutzen zu können.

```
$ ~/git/chat-darc-de-synapse (git)-[dev] % cat group_vars/all/nginx.yml 
---

nginx_site_configs:
  - "matrix.conf"
  - "matrix-element.conf"
  - "matrix-doc.conf"
  
nginx_site_configs_no_tls:
  - "matrix.conf.no-tls"
  - "matrix-element.conf.no-tls"
  - "matrix-doc.conf"

nginx_domains:
  - "{{ matrix_domain}}"
  - "{{ matrix_element_domain }}"
  - "{{ matrix_documentation_domain }}"
```

Namen der Files für die Nginx-Konfigurationen und der entsprechenden Konfigurationen ohne TLS. Weiterhin werden die Domains konfiguriert welche im Nginx erreichbar sein sollen, diese Variable wird auch für Zertifikate via Lets Encrypt genutzt.

```
$ ~/git/chat-darc-de-synapse (git)-[dev] % cat group_vars/all/users.yml     
users:
  - dc7ia
  - do6fp
  - dh8ghh
  - dk7on
  - dl1pz
```

Liste der User-Accounts welche auf dem Server existieren.
