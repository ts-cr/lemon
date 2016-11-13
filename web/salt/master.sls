salt master:
    pkg.installed:
        - names: 
            - salt-master
            - salt-api
            - salt-cloud
        - refresh: True

salt master.conf:
    file.managed:
        - name: /etc/salt/master
        - source: salt://salt/conf/master
        - template: jinja
        - context:
            proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}