kong:
    postgres_database.present:
        - name: kong
        - encoding: UTF8
        - lc_ctype: en_US.UTF-8
        - lc_collate: en_US.UTF-8
        - template: template0
        - owner: postgres
        - user: postgres
        - require:
            - service: postgresql