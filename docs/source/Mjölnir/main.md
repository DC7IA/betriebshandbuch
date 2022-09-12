# Mjölnir 

Zu Moderationszwecken und um Spam fern zu halten wird Mjölnir eingesetzt. 

## Vorraussetzungen

Damit Mjölnir funktioniert werden folgende Dinge vorrausgesetzt.

### Raum

Es wird ein Management zum Steuern von Mjölnir benötigt.

Dieser muss unter #mjolnir zu finden sein und MUSS auf "invite only" eingestellt sein.


### Admin

Der User "mjolnir" muss existieren und Admin sein. Kann mit Synapse-Admin angelegt werden.

### Access Token

Mit `ansible-vault edit inventory/host_vars/matrix.darc.de/vault.yml` beziehungsweise für das Staging-System `ansible-vault edit inventory/host_vars/staging.matrix.darc.de/vault.yml` müssen Access-Token hinterlegt werden:

```
---

mjolnir_access_token: "ACCESS_TOKEN"
```

Der Access-Token kann wie folgt vom Server besorgt werden:

`curl --header "Authorization: Bearer ACCESS_TOKEN" -X POST https://EXAMPLE.COM/_synapse/admin/v1/users/@USER:EXAMPLE.com/login`
