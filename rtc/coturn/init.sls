# new config coturn ubuntu 16.04
coturn pkgs:
    pkg.latest:
        - names: 
            - libc6
            - libevent-core-2.0-5
            - libevent-extra-2.0-5
            - libevent-openssl-2.0-5
            - libevent-pthreads-2.0-5
            - libhiredis-dev
            - libmysqlclient20
            - libpq5
            - libssl1.0.0
            - libhiredis0.13

        - refresh: True

coturn source pkg:
  file:
    - managed
    - name: /usr/src/coturn_4.5.0.3-1build1_amd64.deb
    - source: salt://source/coturn_4.5.0.3-1build1_amd64.deb
    - require:
        - pkg: coturn pkgs

install coturn:
    cmd.run:
        - name: "dpkg -i coturn_4.5.0.3-1build1_amd64.deb && echo 'true' > /srv/coturn"
        - unless: "cat /srv/coturn"
        - cwd: /usr/src/
        - require:
            - file: coturn source pkg