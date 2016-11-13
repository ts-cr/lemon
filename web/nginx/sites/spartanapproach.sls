/etc/nginx/conf.d/spartanapproach.conf:
  file:
    - managed
    - source: salt://nginx/conf/spartanapproach.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644