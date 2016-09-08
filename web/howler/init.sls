include:
    - requirements

/home/overlord/venv/howler:
    virtualenv.managed:
        - user: overlord
        - requirements: salt://howler/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

howler-project:
  git.latest:
    - name: https://github.com/iofun/howler.git
    - target: /home/overlord/howler
    - rev: master
    - user: overlord

howler set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /home/overlord/howler/
        - require:
            - git: howler-project