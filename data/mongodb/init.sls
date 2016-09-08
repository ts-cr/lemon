mongodb:
  pkgrepo.managed:
    - name: deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen 
    - file: /etc/apt/sources.list.d/mongodb.list
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mongodb-org

  pkg.latest:
    - name: mongodb-org
    - refresh: True

mongod.conf:
    file.managed:
        - name: /etc/mongod.conf
        - source: salt://mongodb/mongod.conf
        - user: mongodb
        - group: mongodb
        - mode: 644
        - require:
            - pkg: mongodb-org