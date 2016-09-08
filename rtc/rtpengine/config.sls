
# this stuff is wrong, please check the config file installed with the last version of the engine and compare!

include:
    - rtpengine

ngcp-rtpengine-daemon default:
    file.managed:
        - name: /etc/default/ngcp-rtpengine-daemon
        - source: salt://rtpengine/config/ngcp-rtpengine-daemon
        - template: jinja