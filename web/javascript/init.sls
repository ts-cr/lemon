# stuff for minimize the cdn front-ends
# quakejs

node source:
  file:
    - managed
    - name: /usr/src/node-v6.9.0.tar.gz
    - source: salt://source/node-v6.9.0.tar.gz

untar node:
    cmd.run:
        - name: "tar -zxf node-v6.9.0.tar.gz"
        - unless: cat /srv/nodejs
        - cwd: /usr/src/
        - require:
            - file: node source

compile node:
    cmd.run: 
        - name: "./configure && make && make install && echo 'true' > /srv/nodejs"
        - unless: cat /srv/nodejs
        - cwd: /usr/src/node-v6.9.0/
        - require:
            - cmd: untar node
