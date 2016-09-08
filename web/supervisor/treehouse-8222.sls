supervisor/conf/treehouse-8222.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/treehouse-8222.conf
        - source: salt://supervisor/conf/treehouse-8222.conf
        - template: jinja