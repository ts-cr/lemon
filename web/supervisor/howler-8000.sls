supervisor/conf/howler-8000.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/howler-8000.conf
        - source: salt://supervisor/conf/howler-8000.conf
        - template: jinja