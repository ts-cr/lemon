supervisor/conf/simon-8539.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/simon-8539.conf
        - source: salt://supervisor/conf/simon-8539.conf
        - template: jinja
