
# just a friendly reminder that there's some stuff that we need to fix manually
# meaning the fucking permissions on tls directories and stuff,
# remember also the autorenew on the let's encrypt stuff.

tls.cfg:
    file.managed:
        - name: /etc/kamailio/tls.cfg
        - source: salt://kamailio/config/tls.cfg
        - template: jinja