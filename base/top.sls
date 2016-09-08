# nonsense.ws common knowledge machine


base:

    '*':
        - requirements
        - python
        - erlang
        - erlang.rebar
        - lua
        - lua.rocks
        - lua.fair
        - lua.cortex
        - salt
        - exim
        - zsh
        - user
        - lemon


ai:
    ai_overlords_1:
        - match: nodegroup
        - monit
        - cudnn
        - crontab

    ai_imps_1:
        - match: nodegroup
        - monit
        - cudnn


data:

    data_overlords_1:
        - match: nodegroup
        - postgresql
        - riak
        - riak.schemas
        - asterisk
        - turndb
        - monit
        - monit.postgresql
        - monit.riak
        - crontab

    data_imps_1:
        - match: nodegroup
        - mongodb
        - memcached
        - monit
        - monit.mongodb
        - monit.memcached

    data_imps_2:
        - match: nodegroup
        - monit

    data_imps_3:
        - match: nodegroup
        - monit

    data_imps_4:
        - match: nodegroup
        - monit

    data_imps_5:
        - match: nodegroup
        - monit

    data_imps_6:
        - match: nodegroup
        - monit

    data_imps_7:
        - match: nodegroup
        - monit


rtc:
    rtc_overlords_1:
        - match: nodegroup
        - odbc
        - sngrep
        - kamailio
        - kamailio.config
        - kamailio.syslog
        - kamailio.letsencrypt
        - rtpengine
        - rtpengine.config
        - monit
        - monit.kamailio
        - monit.rtpengine
        - crontab

    rtc_imps_1:
        - match: nodegroup
        - sngrep
        - asterisk
        - asterisk.sounds
        - asterisk.samples
        - asterisk.codec
        - asterisk.config
        - asterisk.godzilla
        - obelix
        - obelix.config
        - odbc
        - fail2ban
        - starfruit
        - supervisor
        - supervisor.starfruit-3888
        - supervisor.obelix
        - monit
        - monit.supervisor
        - monit.asterisk

    rtc_imps_2:
        - match: nodegroup
        - sngrep
        - freeswitch
        - freeswitch.sounds
        - freeswitch.samples
        - freeswitch.config
        - freeswitch.godzilla
        - monit
        - monit.freeswitch

    rtc_imps_3:
        - match: nodegroup
        - odbc
        - coturn
        - coturn.config
        - firestarter
        - firestarter.config
        - supervisor
        - supervisor.firestarter-8349
        - monit
        - monit.coturn

    rtc_imps_4:
        - match: nodegroup
        - sngrep
        - asterisk
        - asterisk.sounds
        - asterisk.samples
        - asterisk.codec
        - asterisk.config
        - asterisk.godzilla
        - obelix
        - obelix.config
        - odbc
        - fail2ban
        - starfruit
        - supervisor
        - supervisor.starfruit-3888
        - supervisor.obelix
        - monit
        - monit.supervisor
        - monit.asterisk

    rtc_imps_5:
        - match: nodegroup
        - monit

    rtc_imps_6:
        - match: nodegroup
        - monit

    rtc_imps_7:
        - match: nodegroup
        - monit


web:
    web_overlords_1:
        - match: nodegroup
        - treehouse
        - simon
        - cebus
        - overlord
        - mango
        - supervisor
        - supervisor.treehouse-8222
        - supervisor.treehouse-8444
        - supervisor.treehouse-8666
        - supervisor.mango-8000
        - supervisor.howler-8001
        - supervisor.spider-8003
        - supervisor.fiorella-8004
        - supervisor.overlord-8888
        - supervisor.cebus-8538
        - supervisor.simon-8539
        - toronja
        - nonsense
        - chaos
        - erebus
        - nyx
        - somnus
        - howler
        - grape
        - sparta
        - spider
        - nginx
        - nginx.openresty
        - nginx.nonsense
        - nginx.iofun
        - nginx.codemachine
        - nginx.spartanapproach
        - haproxy
        - monit
        - monit.nginx
        - monit.haproxy
        - moon
        - crontab
        
    web_imps_1:
        - match: nodegroup
        - monit

    web_imps_2:
        - match: nodegroup
        - monit

    web_imps_3:
        - match: nodegroup
        - monit

    web_imps_4:
        - match: nodegroup
        - monit

    web_imps_5:
        - match: nodegroup
        - monit

    web_imps_6:
        - match: nodegroup
        - monit

    web_imps_7:
        - match: nodegroup
        - monit