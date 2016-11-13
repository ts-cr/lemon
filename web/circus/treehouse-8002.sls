circus/conf/treehouse-8002.ini:
    file.managed:
        - name: /etc/circus/conf.d/treehouse-8002.ini
        - source: salt://circus/conf/treehouse-8002.ini
        - template: jinja