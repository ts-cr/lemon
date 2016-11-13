coturn:
    settings:
        start: yes
    network:
        tcp_port: 3478
        alt_port: 0
        udp_min: 10000
        udp_max: 30000
        listening_ip: 172.31.32.40
        external_ip: 52.41.213.74/172.31.32.40
        relay_ip: 172.31.32.40
        realm: sip.iofun.io
    database:
        host: 172.31.23.26
        dbname: turndb
        user: postgres