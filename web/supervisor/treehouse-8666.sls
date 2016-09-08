supervisor/conf/treehouse-8666.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/treehouse-8666.conf
        - source: salt://supervisor/conf/treehouse-8666.conf
        - template: jinja