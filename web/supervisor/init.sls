/etc/supervisor/supervisord.conf web:
  file:
    - managed
    - name: /etc/supervisor/supervisord.conf
    - source: salt://supervisor/conf/supervisord.conf
    - user: root
    - group: root
    - mode: 644

supervisor:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: supervisor
      - file: /etc/supervisor/supervisord.conf