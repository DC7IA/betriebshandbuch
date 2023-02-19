# Admin-API

## Zugriff auf die Admin-API

Die Dokumentation von Synapse  empfiehlt die Admin-API nicht öffentlich bereit zu stellen, deshalb ist die Admin-API auch nicht frei zugängig.

Folgendes sollte in der SSH-Config vorhanden sein:

```
Host chatdarc
    #Key: SHA256:mnjsK/nfWRbEJTWbmwxjvCuekJWcztNyo9iDx5dlOa4
    HostName matrix.darc.de
    User root
    LocalForward 8008 [::1]:8008

Host chatdarcstaging
    #Key: SHA256:mnjsK/nfWRbEJTWbmwxjvCuekJWcztNyo9iDx5dlOa4
    HostName staging.matrix.darc.de
    User root
    LocalForward 8008 [::1]:8008
```

Unter `http://localhost:8008` kann anschließend die Admin-API erreicht werden während eine SSH-Verbindung zum Matrix-Server besteht.

