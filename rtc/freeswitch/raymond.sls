conf/dialplan/default/00_raymond.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/dialplan/default/00_raymond.xml
        - source: salt://freeswitch/config/conf/dialplan/default/00_raymond.xml
        - template: jinja

/usr/local/freeswitch/sounds/raymond:
    file.directory:
        - user: freeswitch
        - group: daemon

sounds/raymond/voice_press_one.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/raymond/voice_press_one.wav
        - source: salt://sounds/raymond/voice_press_one.wav

raymond_avmd.lua:
    file.managed:
        - name: /usr/local/freeswitch/scripts/raymond_avmd.lua
        - source: salt://freeswitch/scripts/raymond_avmd.lua