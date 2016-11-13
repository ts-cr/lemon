telegraf package:
  file:
    - managed
    - name: /usr/src/telegraf_1.0.1_amd64.deb
    - source: salt://source/telegraf_1.0.1_amd64.deb

install telegraf:
    cmd.run:
        - name: "dpkg -i telegraf_1.0.1_amd64.deb"
        - unless: which telegraf
        - cwd: /usr/src/
        - require:
            - file : telegraf package