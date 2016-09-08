monit/conf/memcached.conf:
    file.managed:
        - name: /etc/monit/conf.d/memcached.conf
        - source: salt://monit/conf/memcached.conf
        - template: jinja