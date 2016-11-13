circus/conf/consul-bootstrap.ini:
    file.managed:
        - name: /etc/circus/conf.d/consul-bootstrap.ini
        - source: salt://circus/conf/consul-bootstrap.ini
        - template: jinja
        - context:
            proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}
