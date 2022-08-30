### Beispiel eines Inventory

```
$ ~/git/chat-darc-de-synapse (git)-[dev] % cat inventory-production.yml 
---

matrix:
  hosts:
    matrix.darc.de:
      matrix_domain: 'matrix.darc.de'
      matrix_element_domain: 'chat.darc.de'
      matrix_documentation_domain: 'hilfe.chat.darc.de'
      matrix_base_url_domain: 'matrix.darc.de'
      matrix_server_name: 'darc.de'
      matrix_admin_email: 'chat@darc.de'
      letsencrypt_email: 'chat@darc.de'
      matrix_sso_client_id: !vault |
        $ANSIBLE_VAULT;1.1;AES256
        32343939326535373064393931626232666638643739653861343662336234633336376330353230
        6235333734386438653931333662346639656334396230320a633763653634376262393031343463
        66623166373537363731646162323862363832373766616365333563623435623439643036666262
        3562663463303339360a353836313038356235383764303261383161333030666365393865366561
        39323232393736656138633835346637356539613737376332326362316634343665306563353534
        3931646534663633613434323932393161373333653634636466
      matrix_sso_client_secret_key: !vault |
        $ANSIBLE_VAULT;1.1;AES256
        36663734393764613865666632646533363266636339396564323236353437366135373038333837
        6461643161643533393537336564386132626361333737640a313636366663666662303662353965
        33623235323633343733346262303933613034333438306435313831303365363031643638316638
        3465643338316365650a306130366231303330613561636461326165333862356131653836613935
        32663639373562623835373533363133346635393837313366356161316332363835663462313063
        3937643437356539626236626263623832613436613338383436
      matrix_sso_endpoint: "https://sso.darc.de"
      matrix_sso_scopes: ['openid', 'profile', 'callsign']
      matrix_sso_displayname: "true"
      matrix_element_show_labs_settings: "false"
      matrix_element_ui_feature_advanced_settings: "false"
      restic_repository_location: "/mnt/backups_nfs"
      restic_nfs_path: "46.38.248.211:/voln438992a1"
```

Hier werden die Variablen für die Domains gesetzt und die Secrets für SSO hinterlegt. Weiterhin finden sich hier die Email-Adressen.
