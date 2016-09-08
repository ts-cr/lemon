/etc/nginx/conf.d/greek.conf:
  file:
    - managed
    - source: salt://nginx/conf/greek.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644