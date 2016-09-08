coturn:
    settings:
        start: yes
    network:
        tcp_port: 3478
        alt_port: 0
        udp_min: 10000
        udp_max: 30000
        listening_ip: 172.31.3.202
        external_ip: 52.39.38.132/172.31.3.202
        relay_ip: 172.31.3.202
        realm: sip.iofun.io
    database:
        host: 172.31.47.69
        dbname: turndb
        user: postgres