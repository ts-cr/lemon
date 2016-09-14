include:
    - requirements


Lua 5.1 packages:
    pkg.installed:
        - names:
            - liblua5.1-dev

asterisk:
    user.present




/var/lib/asterisk:
    file.directory:
        - user: asterisk
        - group: asterisk
        - recurse:
            - user
            - group

/var/run/asterisk:
    file.directory:
        - user: asterisk
        - group: asterisk
        - recurse:
            - user
            - group

/var/log/asterisk:
    file.directory:
        - user: asterisk
        - group: asterisk
        - recurse:
            - user
            - group

/var/spool/asterisk:
    file.directory:
        - user: asterisk
        - group: asterisk
        - recurse:
            - user
            - group

/etc/asterisk:
    file.directory:
        - user: asterisk
        - group: asterisk
        - recurse:
            - user
            - group

/etc/asterisk/keys:
    file.directory:
        - user: asterisk
        - group: asterisk
        - recurse:
            - user
            - group

asterisk source:
  file:
    - managed
    - name: /usr/src/asterisk-11.23.1.tar.gz 
    - source: salt://source/asterisk-11.23.1.tar.gz

untar asterisk:
    cmd.run:
        - name: "tar -zxf asterisk-11.23.1.tar.gz"
        - unless: which asterisk
        - cwd: /usr/src/
        - require:
            - file: asterisk source

opus source:
    file:
        - managed
        - name: /usr/src/opus-1.1.3.tar.gz
        - source: salt://source/opus-1.1.3.tar.gz

untar opus:
    cmd.run:
        - name: "tar -zxf opus-1.1.3.tar.gz"
        - unless: which opus
        - cwd: /usr/src/asterisk-11.23.1
        - require:
            - file: opus source

compile opus:
    cmd.run: 
        - name: "./configure && make && make install "
        - unless: which opus
        - cwd: /usr/src/asterisk-11.23.1/opus-1.1.3
        - require:
            - cmd: untar opus


compile asterisk:
    cmd.run: 
        - name: "./configure && make && make install && make config"
        - unless: which asterisk
        - cwd: /usr/src/asterisk-11.23.1/
        - require:
            - cmd: untar asterisk


Run only if dialplan changed:
  cmd.wait:
    - name: asterisk -rx 'dialplan reload'
    - watch:
        - file: extensions.conf

Run only if SIP changed:
  cmd.wait:
    - name: asterisk -rx 'sip reload'
    - watch:
        - file: sip.conf

Run only if QUEUES changed:
  cmd.wait:
    - name: asterisk -rx 'queue reload'
    - watch:
        - file: queues.conf

Run only if musiconhold changed:
  cmd.wait:
    - name: asterisk -rx 'core reload'
    - watch:
        - file: musiconhold.conf

Run only if voicemail changed:
  cmd.wait:
    - name: asterisk -rx 'voicemail reload'
    - watch:
        - file: voicemail.conf

Run only if features changed:
  cmd.wait:
    - name: asterisk -rx 'core reload'
    - watch:
        - file: features.conf

Run only if codecs changed:
  cmd.wait:
    - name: asterisk -rx 'core reload'
    - watch:
        - file: codecs.conf

Run only if followme changed:
  cmd.wait:
    - name: asterisk -rx 'core reload'
    - watch:
        - file: followme.conf


















