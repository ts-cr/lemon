monit/conf/postgresql.conf:
    file.managed:
        - name: /etc/monit/conf.d/postgresql.conf
        - source: salt://monit/conf/postgresql.conf
        - template: jinja