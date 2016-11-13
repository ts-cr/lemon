circus/conf/consul-server.ini:
    file.managed:
        - name: /etc/circus/conf.d/consul-server.ini
        - source: salt://circus/conf/consul-server.ini
        - template: jinja
        - context:
            proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}
