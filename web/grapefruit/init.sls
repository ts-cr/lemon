grapefruit-projects:
    git.latest:
        - name: https://github.com/machineio/grapefruit.git
        - target: /opt/grapefruit
        - rev: master

        - https_user: gitoverlord
        - https_pass: zxcqwe2016git

install sparta:
    cmd.run: 
        - name: "npm install"
        - unless: which sparta
        - cwd: /opt/grapefruit/sparta/
        - user: root
        - require:
            - git: grapefruit-projects
