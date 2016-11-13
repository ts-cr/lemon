include:
    - requirements

/opt/venv/howler:
    virtualenv.managed:

        - requirements: salt://howler/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

howler-project:
  git.latest:
    - name: https://github.com/iofun/howler.git
    - target: /opt/howler
    - rev: master
    

howler set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /opt/howler/
        - require:
            - git: howler-project