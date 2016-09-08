supervisor/conf/mango-8000.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/mango-8000.conf
        - source: salt://supervisor/conf/mango-8000.conf
        - template: jinja