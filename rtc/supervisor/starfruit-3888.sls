supervisor/conf/starfruit-3888.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/starfruit-3888.conf
        - source: salt://supervisor/conf/starfruit-3888.conf
        - template: jinja