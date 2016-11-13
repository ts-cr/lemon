circus/conf/extractor-8006.ini:
    file.managed:
        - name: /etc/circus/conf.d/extractor-8006.ini
        - source: salt://circus/conf/extractor-8006.ini
        - template: jinja
