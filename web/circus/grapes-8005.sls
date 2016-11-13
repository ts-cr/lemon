circus/conf/grapes-8005.ini:
    file.managed:
        - name: /etc/circus/conf.d/grapes-8005.ini
        - source: salt://circus/conf/grapes-8005.ini
        - template: jinja
