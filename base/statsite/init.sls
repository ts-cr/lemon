statsite packages:
    pkg.installed:
        - names:
            - autoconf
            - automake
            - libtool

statsite-project:
    git.latest:
        - name: https://github.com/armon/statsite.git
        - target: /usr/src/statsite
        - rev: master

compile statsite:
    cmd.run: 
        - name: "./bootstrap.sh && ./configure && make && make install"
        - unless: which statsite
        - cwd: /usr/src/statsite/
        - require:
            - git: statsite-project

statsite.conf:
    file.managed:
        - name: /etc/statsite.conf
        - source: salt://statsite/conf/statsite.conf
        - template: jinja