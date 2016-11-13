/opt/consul/webui:
    file.directory:
        - user: root
        - group: root
        - recurse:
            - user
            - group

web-ui package:
  file:
    - managed
    - name: /opt/consul/webui/consul_0.7.0_web_ui.zip
    - source: salt://source/consul_0.7.0_web_ui.zip

unzip consul-webui:
    cmd.run:
        - name: "unzip consul_0.7.0_web_ui.zip && echo 'true' > /srv/consul-webui"
        - unless: cat /srv/consul-webui
        - cwd: /opt/consul/webui/