serf package:
  file:
    - managed
    - name: /usr/src/serf_0.8.0_linux_amd64.zip
    - source: salt://source/serf_0.8.0_linux_amd64.zip

/opt/serf:
    file.directory:
        - user: root
        - group: root
        - recurse:
            - user
            - group

unzip serf:
    cmd.run:
        - name: "unzip serf_0.8.0_linux_amd64.zip"
        - unless: which serf
        - cwd: /usr/src/

link serf:
    cmd.run:
        - name: "ln -sf /usr/src/serf /opt/serf/serf"
        - unless: which serf
        - require:
            - file: serf package

install serf:
    cmd.run:
        - name: "ln -sf /opt/serf/serf /usr/local/bin/serf"
        - unless: which serf
        - require:
            - file: serf package