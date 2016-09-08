include:
    - coturn

turnserver.conf:
    file.managed:
        - name: /etc/turnserver.conf
        - source: salt://coturn/config/turnserver.conf
        - template: jinja

coturn default:
    file.managed:
        - name: /etc/default/coturn
        - source: salt://coturn/config/coturn
        - template: jinja