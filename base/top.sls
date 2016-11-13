# cloudforest.ws schematic tree

# remember to use multiples of 8 as salt.masters !

# 8 node, 80 cluster, 480 cube, 4800 cloud, 480000 forest.

base:

    '*':
        - user
        - requirements
        - statsite
        - circus
        - circus.statsite
        - lemon
        - salt
        - monit
        - exim
        - serf
        - slurm
        - collectd
        - certbot
        - consul
        - telegraf
        - python
        - erlang
        - erlang.rebar
        - lua
        - lua.rocks
        - lua.fair
        - lua.cortex
        - rkt
        - zsh
        - go

ai:

    # torch, theano and tensorflow services.

    ai_imps_1:
        - match: nodegroup
        - salt.master
        - cudnn
        - rcuda
        - crontab

    ai_imps_2:
        - match: nodegroup
        - cudnn
        - rcuda

data:

    # huge amounts of label data.

    data_imps_1:
        - match: nodegroup
        - salt.master
        - postgresql
        - riak
        - riak.schemas
        - asterisk
        - graphite
        - kong
        - turndb
        - consul.server
        - circus.consul-server
        - monit.postgresql
        - monit.riak
        - crontab

    data_imps_2:
        - match: nodegroup
        - mongodb
        - mysql
        - cockroach
        - influxdb
        - memcached
        - consul.bootstrap
        - circus.consul-bootstrap
        - circus.cockroach-26257
        - monit.mongodb
        - monit.memcached

rtc:

    # real-time communications.

    rtc_imps_1:
        - match: nodegroup
        - salt.master
        - odbc
        - sngrep
        - kamailio
        - kamailio.config
        - kamailio.syslog
        - kamailio.letsencrypt
        - rtpengine
        - rtpengine.config
        - monit.kamailio
        - monit.rtpengine
        - crontab

    rtc_imps_2:
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
        - circus.starfruit-3888
        - circus.obelix
        - monit.asterisk

    rtc_imps_3:
        - match: nodegroup
        - sngrep
        - freeswitch
        - freeswitch.sounds
        - freeswitch.samples
        - freeswitch.config
        - freeswitch.godzilla
        - monit.freeswitch

    rtc_imps_4:
        - match: nodegroup
        - odbc
        - coturn
        - coturn.config
        - fire2ice
        - fire2ice.config
        - circus.firestarter-8349
        - monit.coturn

    rtc_imps_5:
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
        - circus.starfruit-3888
        - circus.obelix
        - monit.circus
        - monit.asterisk

web:

    # nonsense web services.

    web_imps_1:
        - match: nodegroup
        - crontab
        - salt.master
        - consul.agent
        - circus.carbon-server
        - circus.consul-agent
        - circus.treehouse-8002        
        - circus.spider-8003
        - circus.howler-8004
        - circus.grapes-8005
        - circus.extractor-8006
        - circus.graphite-8088
        - circus.cebus-8538
        - circus.simon-8539
        - circus.mango-8888
        - consul.dashboard
        - javascript
        - treehouse
        - simon
        - cebus
        - spider
        - howler
        - mango
        - grapes
        - graphite
        - graphite.grafana
        - grapefruit      
        - extractor
        - moon
        - nginx
        - nginx.kong
        - nginx.openresty
        - nginx.sites.nonsense
        - nginx.sites.iofun
        - nginx.sites.spartanapproach
        - nginx.sites.techsupport
        - nginx.sites.codemachine
        - nginx.sites.shaos
        - nginx.sites.cloudforest
        - collectd.nginx
        - monit.nginx
        - monit.kong
        - sites.iofun
        - sites.cloudforest
        - sites.underworld
        - sites.shaos
        - sites.nonsense
        - sites.gigatech
        - sites.codemachine