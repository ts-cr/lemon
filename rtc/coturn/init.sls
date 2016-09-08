coturn pkgs:
    pkg.latest:
        - names: 
            - libevent-core-2.0-5
            - libevent-extra-2.0-5
            - libevent-openssl-2.0-5
            - libevent-pthreads-2.0-5
            - libhiredis-dev
            - libmysqlclient18
        - refresh: True

coturn source pkg:
  file:
    - managed
    - name: /usr/src/coturn_4.4.5.3-1_amd64.deb 
    - source: salt://source/coturn_4.4.5.3-1_amd64.deb
    - require:
        - pkg: coturn pkgs

install coturn:
    cmd.run:
        - name: "dpkg -i coturn_4.4.5.3-1_amd64.deb && echo 'true' > /srv/coturn"
        - unless: "cat /srv/coturn"
        - cwd: /usr/src/
        - require:
            - file: coturn source pkg