consul/conf/bootstrap/config.json:
    file.managed:
        - name: /etc/consul/bootstrap.json
        - source: salt://consul/conf/bootstrap/config.json
        - template: jinja
        - context:
            proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}