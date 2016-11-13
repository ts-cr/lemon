/etc/nginx/conf.d/shaos.conf:
  file:
    - managed
    - source: salt://nginx/conf/shaos.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644