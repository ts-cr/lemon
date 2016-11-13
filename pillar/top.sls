
# Hello there, remember that pillars are like the trajan column.
# here you store static configuration that later is read by all your imps.

base:

    '*':
        - settings

data:

    data_imps_1:
        - match: nodegroup
        - postgresql
        - riak

    data_imps_2:
        - match: nodegroup
        - memcached
        - mongodb

rtc:

    rtc_imps_1:
        - match: nodegroup
        - kamailio
        - rtpengine
        - odbc

    rtc_imps_2:
        - match: nodegroup
        - asterisk
        - obelix
        - starfruit
        - freeswitch
        - coturn
        - odbc

    rtc_imps_3:
        - match: nodegroup
        - asterisk
        - obelix
        - starfruit
        - freeswitch
        - coturn
        - odbc

    rtc_imps_4:
        - match: nodegroup
        - asterisk
        - obelix
        - starfruit
        - freeswitch
        - firestarter
        - coturn
        - odbc

    rtc_imps_5:
        - match: nodegroup
        - asterisk
        - obelix
        - starfruit
        - freeswitch
        - coturn
        - odbc

web:

    web_imps_1:
        - match: nodegroup
        - mango
        - grapes
        - treehouse
        - extractor
        - graphite
        - overlord
        - cebus
        - simon
        - howler
        - spider
        - nginx
        - supervisor

ai:
    ai_imps_1:
        - match: nodegroup

    ai_imps_2:
        - match: nodegroup