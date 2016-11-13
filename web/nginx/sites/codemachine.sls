/etc/nginx/conf.d/codemachine.conf:
  file:
    - managed
    - source: salt://nginx/conf/codemachine.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644