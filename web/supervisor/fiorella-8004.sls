supervisor/conf/fiorella-8004.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/fiorella-8004.conf
        - source: salt://supervisor/conf/fiorella-8004.conf
        - template: jinja
