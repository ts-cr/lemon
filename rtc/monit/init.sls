/etc/monit/monitrc rtc:
  file:
    - managed
    - name: /etc/monit/monitrc
    - source: salt://monit/conf/monitrc
    - user: root
    - group: root
    - mode: 700

monit:
  pkg.installed:
    - names:
      - monit
  service:
    - running
    - watch:
      - pkg: monit
      - file: /etc/monit/monitrc
