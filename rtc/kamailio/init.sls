kamailio:
  pkgrepo.managed:
    - name: deb http://deb.kamailio.org/kamailio43 trusty main
    - file: /etc/apt/sources.list.d/kamailio.list
    - key_url: http://deb.kamailio.org/kamailiodebkey.gpg
    - require_in:
      - pkg: kamailio

  pkg.latest:
    - name: kamailio
    - refresh: True

kamailio modules:
    pkg.latest:
        - names:
            - kamailio-tls-modules
            - kamailio-unixodbc-modules
            - kamailio-postgres-modules
            - kamailio-memcached-modules
            - kamailio-websocket-modules
            - kamailio-presence-modules
            - kamailio-lua-modules
            - kamailio-python-modules
            - kamailio-geoip-modules
            - kamailio-extra-modules
            - kamailio-utils-modules
            - kamailio-json-modules
            - kamailio-nth
            - kamailio-erlang-modules
        - refresh: True