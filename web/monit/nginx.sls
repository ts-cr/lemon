monit/conf/nginx.conf:
    file.managed:
        - name: /etc/monit/conf.d/nginx.conf
        - source: salt://monit/conf/nginx.conf
        - template: jinja