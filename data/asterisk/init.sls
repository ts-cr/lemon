asterisk:
    postgres_database.present:
        - name: asterisk
        - encoding: UTF8
        - lc_ctype: en_US.UTF-8
        - lc_collate: en_US.UTF-8
        - template: template0
        - owner: postgres
        - user: postgres
        - require:
            - service: postgresql

asterisk dump:
  file:
    - managed
    - name: /tmp/asterisk.sql 
    - source: salt://dump/asterisk.sql

restore asterisk:
    cmd.run: 
        - name: "psql asterisk < asterisk.sql && echo 'true' > /var/lib/postgresql/asterisk"
        - unless: "cat /var/lib/postgresql/asterisk"
        - cwd: /tmp/
        - user: postgres
        - require:
            - postgres_database: asterisk
            - file: asterisk dump