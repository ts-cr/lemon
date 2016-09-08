odbc:
    pkg.latest:
        - name: odbc-postgresql
        - refresh: True

odbc.ini:
    file.managed:
        - name: /etc/odbc.ini
        - source: salt://odbc/odbc.ini
        - template: jinja
        - require:
            - pkg: odbc

odbcinst.ini:
    file.managed:
        - name: /etc/odbcinst.ini
        - source: salt://odbc/odbcinst.ini
        - require:
            - pkg: odbc