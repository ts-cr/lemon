pg_hba.conf:
    file.managed:
        - name: /etc/postgresql/9.4/main/pg_hba.conf
        - source: salt://postgresql/pg_hba.conf
        - user: postgres
        - group: postgres
        - mode: 644
        - require:
            - pkg: postgresql-9.4

postgresql.conf:
    file.managed:
        - name: /etc/postgresql/9.4/main/postgresql.conf
        - source: salt://postgresql/postgresql.conf
        - user: postgres
        - group: postgres
        - mode: 644
        - require:
            - pkg: postgresql-9.4            

postgresql:
  pkgrepo.managed:
    - name: deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main
    - file: /etc/apt/sources.list.d/pgdg.list
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - require_in:
      - pkg: postgresql-9.4

  pkg.latest:
    - name: postgresql-9.4
    - refresh: True

  service.running:
    - enable: True
    - watch:
      - file: /etc/postgresql/9.4/main/pg_hba.conf