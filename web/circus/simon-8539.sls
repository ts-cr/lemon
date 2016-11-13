circus/conf/simon-8539.ini:
    file.managed:
        - name: /etc/circus/conf.d/simon-8539.ini
        - source: salt://circus/conf/simon-8539.ini
        - template: jinja
