# Datenbank

Die Datenbank basiert auf Postgres.

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
