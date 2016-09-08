rebar source:
    git.latest:
        - name: https://github.com/rebar/rebar.git
        - target: /usr/src/rebar
        - rev: master

rebar bootstrap:
    cmd.run:
        - name: "./bootstrap && echo 'true' > /srv/rebar2"
        - unless: "cat /srv/rebar2"
        - cwd: /usr/src/rebar/
        - user: root
        - require:
            - git: rebar source
            - pkg: erlang

/usr/local/bin/rebar:
    file.symlink:
        - target: /usr/src/rebar/rebar
        - unless: "cat /srv/rebar2"
        - require:
            - cmd: rebar bootstrap