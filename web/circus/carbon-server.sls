circus/conf/carbon-server.ini:
    file.managed:
        - name: /etc/circus/conf.d/carbon-server.ini
        - source: salt://circus/conf/carbon-server.ini
        - template: jinja
        - context:
            proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}