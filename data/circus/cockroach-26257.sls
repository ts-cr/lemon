circus/conf/cockroach-26257.ini:
    file.managed:
        - name: /etc/circus/conf.d/cockroach-26257.ini
        - source: salt://circus/conf/cockroach-26257.ini
        - template: jinja
        - context:
            proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}
