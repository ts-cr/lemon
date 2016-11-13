/etc/nginx/conf.d/cloudforest.conf:
  file:
    - managed
    - source: salt://nginx/conf/cloudforest.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644