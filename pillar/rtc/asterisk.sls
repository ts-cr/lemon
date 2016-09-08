asterisk_1:
    rtp:
        rtpstart: 10000
        rtpend: 30000
    sip:
        nat: force_rport,comedia
        localnet: 172.31.2.197/24
        externip: 52.24.171.253
        bindport: 5080

asterisk_2:
    rtp:
        rtpstart: 10000
        rtpend: 30000
    sip:
        nat: force_rport,comedia
        localnet: 172.31.2.197/24
        externip: 52.24.171.253
        bindport: 5080