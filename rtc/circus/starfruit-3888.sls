circus/conf/starfruit-3888.conf:
    file.managed:
        - name: /etc/circus/conf.d/starfruit-3888.conf
        - source: salt://circus/conf/starfruit-3888.conf
        - template: jinja