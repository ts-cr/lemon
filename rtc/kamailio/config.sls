include:
    - kamailio

kamailio.cfg:
    file.managed:
        - name: /etc/kamailio/kamailio.cfg
        - source: salt://kamailio/config/kamailio.cfg
        - template: jinja

dispatcher.list:
    file.managed:
        - name: /etc/kamailio/dispatcher.list
        - source: salt://kamailio/config/dispatcher.list
        - template: jinja

modules.cfg:
    file.managed:
        - name: /etc/kamailio/modules.cfg
        - source: salt://kamailio/config/modules.cfg
        - template: jinja

settings.cfg:
    file.managed:
        - name: /etc/kamailio/settings.cfg
        - source: salt://kamailio/config/settings.cfg
        - template: jinja

kamctlrc:
    file.managed:
        - name: /etc/kamailio/kamctlrc
        - source: salt://kamailio/config/kamctlrc
        - template: jinja

kamailio default:
    file.managed:
        - name: /etc/default/kamailio
        - source: salt://kamailio/config/kamailio
        - template: jinja