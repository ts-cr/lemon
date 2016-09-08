supervisor/conf/cebus-8538.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/cebus-8538.conf
        - source: salt://supervisor/conf/cebus-8538.conf
        - template: jinja
