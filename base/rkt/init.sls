rkt package:
  file:
    - managed
    - name: /usr/src/rkt_1.17.0-1_amd64.deb
    - source: salt://source/rkt_1.17.0-1_amd64.deb

install rkt:
    cmd.run:
        - name: "dpkg -i rkt_1.17.0-1_amd64.deb"
        - unless: which rkt
        - cwd: /usr/src/