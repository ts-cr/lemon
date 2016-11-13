/opt/schemas:
  file.directory:
    - user:  overlord
    - name:  /opt/schemas
    - group: overlord

sparta index schema:
  file:
    - managed
    - name: /opt/schemas/sparta_index_schema.xml
    - source: salt://riak/search/schemas/sparta_index_schema.xml

ensure index script:
  file:
    - managed
    - name: /opt/ensure_indexes.py
    - source: salt://riak/search/ensure_indexes.py

ensure indexes:
    cmd.run: 
        - name: "python ensure_indexes.py"
        - cwd: /opt/
        - require:
            - file: ensure index script