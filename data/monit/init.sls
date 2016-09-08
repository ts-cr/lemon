/etc/monit/monitrc data:
  file:
    - managed
    - name: /etc/monit/monitrc
    - source: salt://monit/conf/monitrc
    - user: root
    - group: root
    - mode: 700

monit:

  service.running:
    - enable: True
    - watch:  
      - pkg: monit
      - file: /etc/monit/monitrc

  pkg.installed:
    - names:
      - monit