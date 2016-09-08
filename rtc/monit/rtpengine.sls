monit/conf/rtpengine.conf:
    file.managed:
        - name: /etc/monit/conf.d/rtpengine.conf
        - source: salt://monit/conf/rtpengine.conf
        - template: jinja