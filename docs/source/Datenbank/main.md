# Datenbank

Die Datenbank basiert auf Postgres.

## Datenbank wiederherstellen

Nach einem Crash der Datenbank kann der Dump wie folgt wiederhergestellt werden.

Nicht vergessen im dritten Befehl den Pfad korrekten einzusetzen.

```
sudo -u postgres psql -c "DROP DATABASE synapse-db;"
sudo -u postgres psql -c "CREATE DATABASE synapse-db ENCODING 'UTF8' LC_COLLATE='C' LC_CTYPE='C' template=template0 OWNER synapse_db_user;"
sudo -u postgres psql synapse-db < /mnt/restic/snapshots/HIER_KORREKTEN_PFAD_NEHMEN_2022-08-30T23\:17\:49+02\:00/opt/db_dumps/db-dump-synaspse-db.sql
```

### Hinweis

Falls der Dump aus dem Backup noch nicht wiederhergestellt wurde:

```
/opt/scripts/restic/restic-mount.sh
```

## Nützliche Abfragen

Nachfolgend nützliche Abfragen. Die Shell wird wie folgt gestartet:

```
root@debian-2gb-nbg1-2:~# cd /tmp
root@debian-2gb-nbg1-2:/tmp# su postgres
postgres@debian-2gb-nbg1-2:/tmp$ psql
psql (13.5 (Debian 13.5-0+deb11u1))
Type "help" for help.

postgres=# 
```

Abfragen der vergebenen Raum-IDs:

`select * from room_aliases;`
