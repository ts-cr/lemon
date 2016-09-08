supervisor/conf/mango-8003.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/mango-8003.conf
        - source: salt://supervisor/conf/mango-8003.conf
        - template: jinja