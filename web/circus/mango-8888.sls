circus/conf/mango-8888.ini:
    file.managed:
        - name: /etc/circus/conf.d/mango-8888.ini
        - source: salt://circus/conf/mango-8888.ini
        - template: jinja