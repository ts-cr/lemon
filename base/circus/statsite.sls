circus/conf/statsite.ini:
    file.managed:
        - name: /etc/circus/conf.d/statsite.ini
        - source: salt://circus/conf/statsite.ini
        - template: jinja