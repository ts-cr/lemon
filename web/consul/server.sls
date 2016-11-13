consul/conf/server/config.json:
    file.managed:
        - name: /etc/consul/server.json
        - source: salt://consul/conf/server/config.json
        - template: jinja
        - context:
            proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}