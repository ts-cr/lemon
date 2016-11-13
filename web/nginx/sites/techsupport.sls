/etc/nginx/conf.d/techsupport.conf:
  file:
    - managed
    - source: salt://nginx/conf/techsupport.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644