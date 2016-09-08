51-kamailio.conf:
    file.managed:
        - name: /etc/rsyslog.d/51-kamailio.conf
        - source: salt://kamailio/config/51-kamailio.conf
        - template: jinja