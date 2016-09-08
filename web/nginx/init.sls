/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://nginx/conf/nginx.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644

nginx:
  service:
    - running
    - watch:
      - file: /etc/nginx/nginx.conf