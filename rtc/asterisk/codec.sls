# http://asterisk.hosting.lv/

codec_g723.so:
    file.managed:
        - name: /usr/lib/asterisk/modules/codec_g723.so
        - source: salt://asterisk/codec/codec_g723.so

codec_g729.so:
    file.managed:
        - name: /usr/lib/asterisk/modules/codec_g729.so
        - source: salt://asterisk/codec/codec_g729.so