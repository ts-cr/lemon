monit/conf/turnserver.conf:
    file.managed:
        - name: /etc/monit/conf.d/turnserver.conf
        - source: salt://monit/conf/turnserver.conf
        - template: jinja