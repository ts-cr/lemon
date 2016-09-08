supervisor/conf/mango-8001.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/mango-8001.conf
        - source: salt://supervisor/conf/mango-8001.conf
        - template: jinja