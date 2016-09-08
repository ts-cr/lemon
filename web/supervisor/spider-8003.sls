supervisor/conf/spider-8003.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/spider-8003.conf
        - source: salt://supervisor/conf/spider-8003.conf
        - template: jinja