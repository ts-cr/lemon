supervisor/conf/mango-8002.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/mango-8002.conf
        - source: salt://supervisor/conf/mango-8002.conf
        - template: jinja