influxdb package:
  file:
    - managed
    - name: /usr/src/influxdb_1.0.2_amd64.deb
    - source: salt://source/influxdb_1.0.2_amd64.deb

install influxdb:
    cmd.run:
        - name: "dpkg -i influxdb_1.0.2_amd64.deb"
        - unless: which influxdb
        - cwd: /usr/src/
        - require:
            - file : influxdb package