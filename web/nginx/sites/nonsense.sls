/etc/nginx/conf.d/nonsense.conf:
  file:
    - managed
    - source: salt://nginx/conf/nonsense.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644