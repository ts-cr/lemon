
# Hello there, remember that pillars are like the trajan column.
# here you store static configuration that later is read by all your overlords and imps.

base:

    '*':
        - settings

data:

    data_overlords_1:
        - match: nodegroup
        - postgresql
        - riak

    data_imps_1:
        - match: nodegroup
        - memcached
        - mongodb

    data_imps_2:
        - match: nodegroup
        - monit


rtc:

    rtc_overlords_1:
        - match: nodegroup
        - kamailio
        - rtpengine
        - odbc

    rtc_imps_1:
        - match: nodegroup
        - asterisk
        - obelix
        - starfruit
        - freeswitch
        - coturn
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
        - firestarter
        - coturn
        - odbc

    rtc_imps_4:
        - match: nodegroup
        - asterisk
        - obelix
        - starfruit
        - freeswitch
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

    rtc_imps_6:
        - match: nodegroup
        - asterisk
        - obelix
        - starfruit
        - freeswitch
        - coturn
        - odbc

    rtc_imps_7:
        - match: nodegroup
        - asterisk
        - obelix
        - starfruit
        - freeswitch
        - coturn
        - odbc

web:

    web_overlords_1:
        - match: nodegroup
        - mango
        - treehouse
        - extractor
        - overlord
        - cebus
        - simon
        - howler
        - spider
        - nginx
        - supervisor
        
    web_imps_1:
        - match: nodegroup
        - nginx

    web_imps_2:
        - match: nodegroup
        - supervisor

ai:
    ai_overlords_1:
        - match: nodegroup

    ai_imps_1:
        - match: nodegroup