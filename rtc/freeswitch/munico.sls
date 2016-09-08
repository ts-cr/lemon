conf/dialplan/default/00_munico.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/dialplan/default/00_munico.xml
        - source: salt://freeswitch/config/conf/dialplan/default/00_munico.xml
        - template: jinja

/usr/local/freeswitch/sounds/munico:
    file.directory:
        - user: freeswitch
        - group: daemon

munico.wav:
    file.managed:
        - name: /usr/local/freeswitch/sounds/munico/munico.wav
        - source: salt://sounds/munico/munico.wav

munico_avmd.lua:
    file.managed:
        - name: /usr/local/freeswitch/scripts/munico_avmd.lua
        - source: salt://freeswitch/scripts/munico_avmd.lua
