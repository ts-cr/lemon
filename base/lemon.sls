# Watch for changes to a github repo
lemon-project:
    git.latest:
        - name: https://github.com/anthony6891/lemon.git
        - target: /usr/src/lemon
        - rev: master

lemon set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /usr/src/lemon/
        - require:
            - git: lemon-project