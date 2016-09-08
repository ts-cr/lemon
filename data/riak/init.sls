pip riak:
  pip.installed:
    - name: riak
    - require:
      - pkg: python-pip

java packages:
    pkg.installed:
        - names:
            - default-jre
            - default-jdk

riakkv:
  pkgrepo.managed:
    - name: deb https://packagecloud.io/basho/riak/ubuntu/ trusty main
    - file: /etc/apt/sources.list.d/riak.list
    - key_url: https://packagecloud.io/gpg.key
    - require_in:
      - pkg: riak

  pkg.latest:
    - name: riak
    - refresh: True

/etc/riak/riak.conf:
  file:
    - managed
    - source: salt://riak/conf/riak.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644

/etc/default/riak:
    file.managed:
        - name: /etc/default/riak
        - source: salt://riak/conf/riak
        - require:
            - pkg: riak