kamailio:
    settings:
        dbengine: PGSQL
        dbhost: 172.31.23.26
        dbname: kamailio
        dbrootuser: postgres
        database: postgres@172.31.23.26/kamailio-postgresql
    network:
        address_1: 52.41.244.191
        local_address_1: 172.31.32.42
        domain: sip.iofun.io
        sip_port: 5060
        sips_port: 5061
        ws_port: 10080
        wss_port: 10081
        msrp_port: 9000
    asterisk:
        database: postgres@172.31.23.26/asterisk-postgresql
        address_1: 172.31.36.130
    freeswith:
        database: postgres@172.31.23.26/freeswitch-postgresql
        address_1: 172.31.2.199
    msrp:
        min_expires: 1800
        max_expires: 3600
