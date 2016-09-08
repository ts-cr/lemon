/etc/nginx/conf.d/iofun.conf:
  file:
    - managed
    - source: salt://nginx/conf/iofun.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644