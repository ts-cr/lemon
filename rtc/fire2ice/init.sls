fire2ice-project:
  git.latest:
    - name: https://github.com/iofun/fire2ice.git
    - target: /opt/fire2ice
    - rev: master
    

fire2ice set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /opt/fire2ice/
        - require:
            - git: fire2ice-project