collectd packages:
    pkg.installed:
        - names:
            - collectd
            - collectd-utils

collectd/collectd.conf:
    file.managed:
        - name: /etc/collectd/collectd.conf
        - source: salt://collectd/conf/collectd.conf
        - template: jinja