conf/dialplan/default/00_godzilla.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/dialplan/default/00_godzilla.xml
        - source: salt://freeswitch/config/conf/dialplan/default/00_godzilla.xml
        - template: jinja

conf/dialplan/default/00_godzilla_1.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/dialplan/default/00_godzilla_1.xml
        - source: salt://freeswitch/config/conf/dialplan/default/00_godzilla_1.xml
        - template: jinja

/usr/local/freeswitch/sounds/godzilla:
    file.directory:
        - user: freeswitch
        - group: daemon

studentloan.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/godzilla/studentloan.wav
        - source: salt://sounds/godzilla/studentloan.wav

voice_press_1.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/godzilla/voice_press_1.wav
        - source: salt://sounds/godzilla/voice_press_1.wav

voicemail.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/godzilla/voicemail.wav
        - source: salt://sounds/godzilla/voicemail.wav

voicemail_1.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/godzilla/voicemail_1.wav
        - source: salt://sounds/godzilla/voicemail_1.wav

godzilla_avmd.lua:
    file.managed:
        - name: /usr/local/freeswitch/scripts/godzilla_avmd.lua
        - source: salt://freeswitch/scripts/godzilla_avmd.lua

godzilla_1_avmd.lua:
    file.managed:
        - name: /usr/local/freeswitch/scripts/godzilla_1_avmd.lua
        - source: salt://freeswitch/scripts/godzilla_1_avmd.lua