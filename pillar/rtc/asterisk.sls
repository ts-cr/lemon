asterisk_1:
    rtp:
        rtpstart: 10000
        rtpend: 30000
    sip:
        nat: force_rport,comedia
        localnet: 172.31.36.130/24
        externip: 52.24.171.253
        bindport: 5060
