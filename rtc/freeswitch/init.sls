include:
    - requirements

freeswitch:
    user.present:
        - home: /usr/local/freeswitch
        - groups:
            - daemon

daemon:
    group.present:
        - system: True
        - addusers:
            - freeswitch

/usr/local/freeswitch:
    file.directory:
        - user: freeswitch
        - group: daemon
        - mode: 700
        - recurse:
            - user
            - group
            - mode

freeswitch git code:
    git.latest:
        - name: https://freeswitch.org/stash/scm/fs/freeswitch.git
        - target: /usr/src/git/freeswitch
        - rev: v1.6
        - user: root

bootstrap freeswitch:
    cmd.run:
        - name: "./bootstrap.sh"
        - unless: "cat /srv/freeswitch"
        - cwd: /usr/src/git/freeswitch/

freeswitch modules.conf:
    file.managed:
        - name: /usr/src/git/freeswitch/modules.conf
        - source: salt://freeswitch/config/modules.conf
        - template: jinja
        - require:
            - cmd: bootstrap freeswitch

compile freeswitch:
    cmd.run: 
        - name: "./configure && make && make install" # && echo 'true' > /srv/freeswitch
        - unless: "cat /srv/freeswitch"
        - cwd: /usr/src/git/freeswitch/
        - require:
            - cmd: bootstrap freeswitch

/usr/local/bin/fs_cli:
  file.symlink:
    - target: /usr/local/freeswitch/bin/fs_cli
    - unless: "cat /srv/freeswitch"