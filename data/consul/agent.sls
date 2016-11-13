consul/conf/agent/config.json:
    file.managed:
        - name: /etc/consul/agent.json
        - source: salt://consul/conf/agent/config.json
        - template: jinja
        - context:
            proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}