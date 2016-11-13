circus/conf/obelix.conf:
    file.managed:
        - name: /etc/circus/conf.d/obelix.conf
        - source: salt://circus/conf/obelix.conf
        - template: jinja