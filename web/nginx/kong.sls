kong:
  git.latest:
    - name: https://github.com/Mashape/kong.git
    - target: /usr/src/kong
    - rev: master

/usr/local/kong:
    file.directory:
        - user: root
        - group: root
        - recurse:
            - user
            - group

make kong:
    cmd.run:
        - name: "make install"
        - unless: which kong
        - cwd: /usr/src/kong/
        - require:
            - git: kong

/etc/kong.conf:
  file:
    - managed
    - source: salt://nginx/conf/kong.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644

kong link:
    cmd.run: 
        - name: "ln -sf /usr/src/kong/bin/kong /usr/local/bin/kong"
        - unless: which kong
        - require:
            - cmd: make kong

busted link:
    cmd.run: 
        - name: "ln -sf /usr/src/kong/bin/busted /usr/local/bin/busted"
        - unless: which busted
        - require:
            - cmd: make kong