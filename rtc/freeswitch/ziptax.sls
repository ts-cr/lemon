conf/dialplan/default/00_ziptax.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/dialplan/default/00_ziptax.xml
        - source: salt://freeswitch/config/conf/dialplan/default/00_ziptax.xml
        - template: jinja

/usr/local/freeswitch/sounds/ziptax:
    file.directory:
        - user: freeswitch
        - group: daemon

sounds/ziptax/voice_press_1.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/ziptax/voice_press_1.wav
        - source: salt://sounds/ziptax/voice_press_1.wav

sounds/ziptax/voicemail.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/ziptax/voicemail.wav
        - source: salt://sounds/ziptax/voicemail.wav

ziptax_avmd.lua:
    file.managed:
        - name: /usr/local/freeswitch/scripts/ziptax_avmd.lua
        - source: salt://freeswitch/scripts/ziptax_avmd.lua