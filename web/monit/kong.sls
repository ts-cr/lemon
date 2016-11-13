monit/conf/kong.conf:
    file.managed:
        - name: /etc/monit/conf.d/kong.conf
        - source: salt://monit/conf/kong.conf
        - template: jinja