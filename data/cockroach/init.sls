cockroach source:
  file:
    - managed
    - name: /usr/src/cockroach-latest.linux-amd64.tgz
    - source: salt://source/cockroach-latest.linux-amd64.tgz

/opt/cockroach:
    file.directory:
        - user: root
        - group: root
        - recurse:
            - user
            - group

untar cockroach:
    cmd.run:
        - name: "tar -zxf cockroach-latest.linux-amd64.tgz"
        - unless: which cockroach
        - cwd: /usr/src/
        - require:
            - file: cockroach source

link cockroach:
    cmd.run:
        - name: "ln -sf /usr/src/cockroach-latest.linux-amd64/cockroach /opt/cockroach/cockroach"
        - unless: which cockroach
        - require:
            - file: cockroach source

install cockroach:
    cmd.run:
        - name: "ln -sf /opt/cockroach/cockroach /usr/local/bin/cockroach"
        - unless: which cockroach
        - require:
            - file: cockroach source