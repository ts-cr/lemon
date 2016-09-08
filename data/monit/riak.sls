monit/conf/riak.conf:
    file.managed:
        - name: /etc/monit/conf.d/riak.conf
        - source: salt://monit/conf/riak.conf
        - template: jinja