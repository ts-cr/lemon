consul package:
  file:
    - managed
    - name: /opt/consul/consul_0.7.0_linux_amd64.zip
    - source: salt://source/consul_0.7.0_linux_amd64.zip

consul-template package:
  file:
    - managed
    - name: /opt/consul/consul-template_0.16.0_linux_amd64.zip
    - source: salt://source/consul-template_0.16.0_linux_amd64.zip

/opt/consul:
    file.directory:
        - user: root
        - group: root
        - recurse:
            - user
            - group

/etc/consul:
    file.directory:
        - user: root
        - group: root
        - recurse:
            - user
            - group

/etc/consul/consul.d:
    file.directory:
        - user: root
        - group: root
        - recurse:
            - user
            - group

unzip consul:
    cmd.run:
        - name: "unzip consul_0.7.0_linux_amd64.zip"
        - unless: which consul
        - cwd: /opt/consul/

install consul:
    cmd.run:
        - name: "ln -sf /opt/consul/consul /usr/local/bin/consul"
        - unless: which consul
        - require:
            - file: consul package

unzip consul-template:
    cmd.run:
        - name: "unzip consul-template_0.16.0_linux_amd64.zip"
        - unless: which consul-template
        - cwd: /opt/consul/

install consul-template:
    cmd.run:
        - name: "ln -sf /opt/consul/consul-template /usr/local/bin/consul-template"
        - unless: which consul-template
        - require:
            - file: consul-template package