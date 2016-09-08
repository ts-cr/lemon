supervisor/conf/treehouse-8444.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/treehouse-8444.conf
        - source: salt://supervisor/conf/treehouse-8444.conf
        - template: jinja