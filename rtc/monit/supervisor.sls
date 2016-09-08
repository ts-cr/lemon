monit/conf/supervisor.conf:
    file.managed:
        - name: /etc/monit/conf.d/supervisor.conf
        - source: salt://monit/conf/supervisor.conf
        - template: jinja