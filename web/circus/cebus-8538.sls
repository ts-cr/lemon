circus/conf/cebus-8538.ini:
    file.managed:
        - name: /etc/circus/conf.d/cebus-8538.ini
        - source: salt://circus/conf/cebus-8538.ini
        - template: jinja
