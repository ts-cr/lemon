include:
    - asterisk

acl.conf:
    file.managed:
        - name: /etc/asterisk/acl.conf
        - source: salt://asterisk/config/acl.conf

alarmreceiver.conf:
    file.managed:
        - name: /etc/asterisk/alarmreceiver.conf
        - source: salt://asterisk/config/alarmreceiver.conf

amd.conf:
    file.managed:
        - name: /etc/asterisk/amd.conf
        - source: salt://asterisk/config/amd.conf

app_skel.conf:
    file.managed:
        - name: /etc/asterisk/app_skel.conf
        - source: salt://asterisk/config/app_skel.conf

asterisk.conf:
    file.managed:
        - name: /etc/asterisk/asterisk.conf
        - source: salt://asterisk/config/asterisk.conf

ccss.conf:
    file.managed:
        - name: /etc/asterisk/ccss.conf
        - source: salt://asterisk/config/ccss.conf

cdr.conf:
    file.managed:
        - name: /etc/asterisk/cdr.conf
        - source: salt://asterisk/config/cdr.conf

cdr_adaptive_odbc.conf:
    file.managed:
        - name: /etc/asterisk/cdr_adaptive_odbc.conf
        - source: salt://asterisk/config/cdr_adaptive_odbc.conf

cdr_custom.conf:
    file.managed:
        - name: /etc/asterisk/cdr_custom.conf
        - source: salt://asterisk/config/cdr_custom.conf

cdr_mongodb.conf:
    file.managed:
        - name: /etc/asterisk/cdr_mongodb.conf
        - source: salt://asterisk/config/cdr_mongodb.conf

cdr_odbc.conf:
    file.managed:
        - name: /etc/asterisk/cdr_odbc.conf
        - source: salt://asterisk/config/cdr_odbc.conf

cel.conf:
    file.managed:
        - name: /etc/asterisk/cel.conf
        - source: salt://asterisk/config/cel.conf

cel_custom.conf:
    file.managed:
        - name: /etc/asterisk/cel_custom.conf
        - source: salt://asterisk/config/cel_custom.conf

cel_odbc.conf:
    file.managed:
        - name: /etc/asterisk/cel_odbc.conf
        - source: salt://asterisk/config/cel_odbc.conf

cli.conf:
    file.managed:
        - name: /etc/asterisk/cli.conf
        - source: salt://asterisk/config/cli.conf

cli_aliases.conf:
    file.managed:
        - name: /etc/asterisk/cli_aliases.conf
        - source: salt://asterisk/config/cli_aliases.conf

cli_permissions.conf:
    file.managed:
        - name: /etc/asterisk/cli_permissions.conf
        - source: salt://asterisk/config/cli_permissions.conf

codecs.conf:
    file.managed:
        - name: /etc/asterisk/codecs.conf
        - source: salt://asterisk/config/codecs.conf

confbridge.conf:
    file.managed:
        - name: /etc/asterisk/confbridge.conf
        - source: salt://asterisk/config/confbridge.conf

config_test.conf:
    file.managed:
        - name: /etc/asterisk/config_test.conf
        - source: salt://asterisk/config/config_test.conf

extconfig.conf:
    file.managed:
        - name: /etc/asterisk/extconfig.conf
        - source: salt://asterisk/config/extconfig.conf

extensions.lua:
    file.managed:
        - name: /etc/asterisk/extensions.lua
        - source: salt://asterisk/config/extensions.lua

extensions.conf:
    file.managed:
        - name: /etc/asterisk/extensions.conf
        - source: salt://asterisk/config/extensions.conf

extensions_minivm.conf:
    file.managed:
        - name: /etc/asterisk/extensions_minivm.conf
        - source: salt://asterisk/config/extensions_minivm.conf

features.conf:
    file.managed:
        - name: /etc/asterisk/features.conf
        - source: salt://asterisk/config/features.conf

followme.conf:
    file.managed:
        - name: /etc/asterisk/followme.conf
        - source: salt://asterisk/config/followme.conf

func_odbc.conf:
    file.managed:
        - name: /etc/asterisk/func_odbc.conf
        - source: salt://asterisk/config/func_odbc.conf

http.conf:
    file.managed:
        - name: /etc/asterisk/http.conf
        - source: salt://asterisk/config/http.conf

indications.conf:
    file.managed:
        - name: /etc/asterisk/indications.conf
        - source: salt://asterisk/config/indications.conf

logger.conf:
    file.managed:
        - name: /etc/asterisk/logger.conf
        - source: salt://asterisk/config/logger.conf

manager.conf:
    file.managed:
        - name: /etc/asterisk/manager.conf
        - source: salt://asterisk/config/manager.conf

meetme.conf:
    file.managed:
        - name: /etc/asterisk/meetme.conf
        - source: salt://asterisk/config/meetme.conf

minivm.conf:
    file.managed:
        - name: /etc/asterisk/minivm.conf
        - source: salt://asterisk/config/minivm.conf

modules.conf:
    file.managed:
        - name: /etc/asterisk/modules.conf
        - source: salt://asterisk/config/modules.conf

musiconhold.conf:
    file.managed:
        - name: /etc/asterisk/musiconhold.conf
        - source: salt://asterisk/config/musiconhold.conf

phone.conf:
    file.managed:
        - name: /etc/asterisk/phone.conf
        - source: salt://asterisk/config/phone.conf

phoneprov.conf:
    file.managed:
        - name: /etc/asterisk/phoneprov.conf
        - source: salt://asterisk/config/phoneprov.conf

queuerules.conf:
    file.managed:
        - name: /etc/asterisk/queuerules.conf
        - source: salt://asterisk/config/queuerules.conf

queues.conf:
    file.managed:
        - name: /etc/asterisk/queues.conf
        - source: salt://asterisk/config/queues.conf

res_curl.conf:
    file.managed:
        - name: /etc/asterisk/res_curl.conf
        - source: salt://asterisk/config/res_curl.conf

res_odbc.conf:
    file.managed:
        - name: /etc/asterisk/res_odbc.conf
        - source: salt://asterisk/config/res_odbc.conf

res_stun_monitor.conf:
    file.managed:
        - name: /etc/asterisk/res_stun_monitor.conf
        - source: salt://asterisk/config/res_stun_monitor.conf

rtp.conf:
    file.managed:
        - name: /etc/asterisk/rtp.conf
        - source: salt://asterisk/config/rtp.conf
        - template: jinja

say.conf:
    file.managed:
        - name: /etc/asterisk/say.conf
        - source: salt://asterisk/config/say.conf

sip.conf:
    file.managed:
        - name: /etc/asterisk/sip.conf
        - source: salt://asterisk/config/sip.conf
        - template: jinja

sip_notify.conf:
    file.managed:
        - name: /etc/asterisk/sip_notify.conf
        - source: salt://asterisk/config/sip_notify.conf

udptl.conf:
    file.managed:
        - name: /etc/asterisk/udptl.conf
        - source: salt://asterisk/config/udptl.conf

voicemail.conf:
    file.managed:
        - name: /etc/asterisk/voicemail.conf
        - source: salt://asterisk/config/voicemail.conf