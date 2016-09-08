turndb:
    postgres_database.present:
        - name: turndb
        - encoding: UTF8
        - lc_ctype: en_US.UTF-8
        - lc_collate: en_US.UTF-8
        - template: template0
        - owner: postgres
        - user: postgres
        - require:
            - service: postgresql

turndb dump:
  file:
    - managed
    - name: /tmp/turndb.sql 
    - source: salt://dump/turndb.sql


# move this to /srv/sql-turndb
restore turndb:
    cmd.run: 
        - name: "psql turndb < turndb.sql && echo 'true' > /var/lib/postgresql/turndb"
        - unless: "cat /var/lib/postgresql/turndb"
        - cwd: /tmp/
        - user: postgres
        - require:
            - postgres_database: turndb
            - file: turndb dump