conf/dialplan/default/00_radio.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/dialplan/default/00_radio.xml
        - source: salt://freeswitch/config/conf/dialplan/default/00_radio.xml
        - template: jinja

/usr/local/freeswitch/sounds/radio:
    file.directory:
        - user: freeswitch
        - group: daemon

radio urbano.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/radio/urbano.wav
        - source: salt://sounds/radio/urbano.wav

radio voicemail.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/radio/voicemail.wav
        - source: salt://sounds/radio/voicemail.wav

radio_avmd.lua:
    file.managed:
        - name: /usr/local/freeswitch/scripts/radio_avmd.lua
        - source: salt://freeswitch/scripts/radio_avmd.lua