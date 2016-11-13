circus/conf/howler-8004.ini:
    file.managed:
        - name: /etc/circus/conf.d/howler-8004.ini
        - source: salt://circus/conf/howler-8004.ini
        - template: jinja