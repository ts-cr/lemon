include:
    - requirements

/home/overlord/venv/fiorella:
    virtualenv.managed:
        - user: overlord
        - requirements: salt://fiorella/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

fiorella-project:
  git.latest:
    - name: https://github.com/machineio/fiorella.git
    - target: /home/overlord/fiorella
    - rev: master
    - user: overlord

fiorella set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /home/overlord/fiorella/
        - require:
            - git: fiorella-project