/home/overlord/schemas:
  file.directory:
    - user:  overlord
    - name:  /home/overlord/schemas
    - group: overlord

sparta index schema:
  file:
    - managed
    - name: /home/overlord/schemas/sparta_index_schema.xml
    - source: salt://riak/search/schemas/sparta_index_schema.xml

ensure index script:
  file:
    - managed
    - name: /home/overlord/ensure_indexes.py
    - source: salt://riak/search/ensure_indexes.py

ensure indexes:
    cmd.run: 
        - name: "python ensure_indexes.py"
        - cwd: /home/overlord/
        - require:
            - file: ensure index script