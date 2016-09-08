monit/conf/asterisk.conf:
    file.managed:
        - name: /etc/monit/conf.d/asterisk.conf
        - source: salt://monit/conf/asterisk.conf
        - template: jinja