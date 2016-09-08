monit/conf/mongodb.conf:
    file.managed:
        - name: /etc/monit/conf.d/mongodb.conf
        - source: salt://monit/conf/mongodb.conf
        - template: jinja