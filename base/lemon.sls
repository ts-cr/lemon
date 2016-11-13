# Watch for changes to a github repo
lemon-project:
    git.latest:
        - name: https://github.com/iofun/lemon.git
        - target: /usr/src/lemon
        - rev: greek

lemon set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/greek"
        - cwd: /usr/src/lemon/
        - require:
            - git: lemon-project