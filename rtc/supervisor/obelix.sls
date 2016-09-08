supervisor/conf/obelix.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/obelix.conf
        - source: salt://supervisor/conf/obelix.conf
        - template: jinja