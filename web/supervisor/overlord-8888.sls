supervisor/conf/overlord-8888.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/overlord-8888.conf
        - source: salt://supervisor/conf/overlord-8888.conf
        - template: jinja
