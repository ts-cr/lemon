circus/conf/graphite-8088.ini:
    file.managed:
        - name: /etc/circus/conf.d/graphite-8088.ini
        - source: salt://circus/conf/graphite-8088.ini
        - template: jinja
