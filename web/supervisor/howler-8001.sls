supervisor/conf/howler-8001.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/howler-8001.conf
        - source: salt://supervisor/conf/howler-8001.conf
        - template: jinja