circus/conf/spider-8003.ini:
    file.managed:
        - name: /etc/circus/conf.d/spider-8003.ini
        - source: salt://circus/conf/spider-8003.ini
        - template: jinja