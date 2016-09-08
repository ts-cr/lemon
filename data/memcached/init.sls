memcached.conf:
    file.managed:
        - name: /etc/memcached.conf
        - source: salt://memcached/memcached.conf
        - template: jinja
        - require:
            - pkg: memcached

memcached:
  pkg.installed:
    - names:
      - memcached
      - libmemcached-dev
      - libmemcached-tools