include:
    - freeswitch

fs make samples:
    cmd.run: 
        - name: "make samples && echo 'true' > /usr/src/freeswitch-samples"
        - unless: "cat /usr/src/freeswitch-samples"
        - cwd: /usr/src/git/freeswitch/