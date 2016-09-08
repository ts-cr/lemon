supervisor/conf/firestarter-8349.conf:
    file.managed:
        - name: /etc/supervisor/conf.d/firestarter-8349.conf
        - source: salt://supervisor/conf/firestarter-8349.conf
        - template: jinja