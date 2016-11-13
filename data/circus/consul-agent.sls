circus/conf/consul-agent.ini:
    file.managed:
        - name: /etc/circus/conf.d/consul-agent.ini
        - source: salt://circus/conf/consul-agent.ini
        - template: jinja
        - context:
            proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}
