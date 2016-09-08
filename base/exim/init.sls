/etc/exim4/update-exim4.conf base:
  file:
    - managed
    - name: /etc/exim4/update-exim4.conf.conf
    - source: salt://exim/conf/update-exim4.conf
    - user: root
    - group: root
    - mode: 700

/etc/exim4/passwd.client base:
  file:
    - managed
    - name: /etc/exim4/passwd.client
    - source: salt://exim/conf/passwd.client
    - user: root
    - group: Debian-exim
    - mode: 640

exim4:
  pkg.installed:
    - names:
      - exim4
      - exim4-config
  service:
    - running
    - watch:
      - pkg: exim4
      - file: /etc/exim4/update-exim4.conf.conf

exim4 update:
    cmd.run:
        - name: "update-exim4.conf && invoke-rc.d exim4 restart && exim4 -qff && echo 'true' > /srv/exim"
        - unless: "cat /srv/dino"
        - cwd: /srv/
        - require:
            - pkg: exim4
