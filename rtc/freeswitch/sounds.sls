include:
    - freeswitch

fs make sounds:
    cmd.run: 
        - name: "make cd-sounds-install && make cd-moh-install && echo 'true' > /usr/src/freeswitch-sound"
        - unless: "cat /usr/src/freeswitch-sound"
        - cwd: /usr/src/git/freeswitch/