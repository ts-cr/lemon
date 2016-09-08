monit/conf/freeswitch.conf:
    file.managed:
        - name: /etc/monit/conf.d/freeswitch.conf
        - source: salt://monit/conf/freeswitch.conf
        - template: jinja