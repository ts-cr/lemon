fail2ban:
    pkg.latest:
        - name: fail2ban
        - refresh: True

jail.conf:
    file.managed:
        - name: /etc/fail2ban/jail.conf
        - source: salt://fail2ban/jail.conf
        - template: jinja
        - require:
            - pkg: fail2ban

asterisk filter:
    file.managed:
        - name: /etc/fail2ban/filter.d/asterisk.conf
        - source: salt://fail2ban/asterisk.conf
        - require:
            - pkg: fail2ban

custom asterisk filter:
    file.managed:
        - name: /etc/fail2ban/filter.d/full_asterisk.conf
        - source: salt://fail2ban/full_asterisk.conf
        - require:
            - pkg: fail2ban