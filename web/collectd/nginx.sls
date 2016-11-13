collectd/nginx.conf:
    file.managed:
        - name: /etc/collectd/collectd.conf.d/nginx.conf
        - source: salt://collectd/conf/nginx.conf
        - template: jinja