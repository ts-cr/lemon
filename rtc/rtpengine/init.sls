include:
    - requirements

rtpengine-project:
    git.latest:
        - name: https://github.com/sipwise/rtpengine.git
        - target: /usr/src/rtpengine
        - rev: master

clean rtpengine:
    cmd.run:
        - name: "./debian/flavors/no_ngcp"
        - unless: "cat /usr/src/rtpengine/rtpengine"
        - cwd: /usr/src/rtpengine/
        - require:
            - git: rtpengine-project

build debian pkgs:
    cmd.run:
        - name: "dpkg-buildpackage"
        - unless: "cat /usr/src/rtpengine/rtpengine"
        - cwd: /usr/src/rtpengine/
        - require:
            - cmd: clean rtpengine

install daemon:
    cmd.run:
        - name: "dpkg -i ngcp-rtpengine-daemon_*_amd64.deb"
        - unless: "cat /usr/src/rtpengine/rtpengine"
        - cwd: /usr/src/
        - require:
            - cmd: build debian pkgs

install rtpengine iptables:
    cmd.run:
        - name: "dpkg -i ngcp-rtpengine-iptables_*_amd64.deb"
        - unless: "cat /usr/src/rtpengine/rtpengine"
        - cwd: /usr/src/
        - require:
            - cmd: build debian pkgs

install rtpengine kernel:
    cmd.run:
        - name: "dpkg -i ngcp-rtpengine-kernel-dkms_*_all.deb && echo 'true' > /usr/src/rtpengine/rtpengine"
        - unless: "cat /usr/src/rtpengine/rtpengine"
        - cwd: /usr/src/
        - require:
            - cmd: build debian pkgs