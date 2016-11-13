/etc/grafana:
    file.directory:
        - user: root
        - group: root
        - recurse:
            - user
            - group

grafana/grafana.ini:
    file.managed:
        - name: /etc/grafana/grafana.ini
        - source: salt://graphite/conf/grafana.ini
        - template: jinja