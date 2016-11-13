include:
    - fire2ice

/etc/opt/firestarter:
  file.directory:
    - name:  /etc/opt/firestarter

firestarter.conf:
    file.managed:
        - name: /etc/opt/firestarter/firestarter.conf
        - source: salt://firestarter/config/firestarter.conf
        - template: jinja