/etc/circus/circusd.ini base:
  file:
    - managed
    - name: /etc/circus/circusd.ini
    - source: salt://circus/conf/circusd.ini
    - template: jinja
    - context:
        proxy_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}

circus and chaussette:

  pkg.installed:
    - names:
      - circus
      - chaussette

run pip-circus:
    cmd.run:
        - name: "pip install circus"

run pip-circus-web:
    cmd.run:
        - name: "pip install circus-web"

run pip-chaussette:
    cmd.run:
        - name: "pip install chaussette"