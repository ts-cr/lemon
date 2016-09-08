include:
    - obelix

conf/obelix.ini:
    file.managed:
        - name: /srv/obelix.ini
        - source: salt://obelix/config/obelix.ini
        - template: jinja