monit/conf/kamailio.conf:
    file.managed:
        - name: /etc/monit/conf.d/kamailio.conf
        - source: salt://monit/conf/kamailio.conf
        - template: jinja