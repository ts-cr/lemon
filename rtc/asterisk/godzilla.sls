/var/lib/asterisk/sounds/godzilla:
    file.directory:
        - user: asterisk
        - group: asterisk

studentloan.wav:
    file.managed:
        - name: /var/lib/asterisk/sounds/godzilla/studentloan.wav
        - source: salt://sounds/godzilla/studentloan.wav

voicemail.wav:
    file.managed:
        - name: /var/lib/asterisk/sounds/godzilla/voicemail.wav
        - source: salt://sounds/godzilla/voicemail.wav