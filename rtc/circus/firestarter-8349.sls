circus/conf/firestarter-8349.conf:
    file.managed:
        - name: /etc/circus/conf.d/firestarter-8349.conf
        - source: salt://circus/conf/firestarter-8349.conf
        - template: jinja