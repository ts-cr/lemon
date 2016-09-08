firestarter-project:
  git.latest:
    - name: https://github.com/iofun/firestarter.git
    - target: /home/overlord/firestarter
    - rev: master
    - user: overlord

firestarter set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /home/overlord/firestarter/
        - require:
            - git: firestarter-project