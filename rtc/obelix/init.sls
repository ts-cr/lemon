include:
    - requirements

/home/asterisk/venv/obelix:
    virtualenv.managed:
        - user: asterisk
        - requirements: salt://obelix/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

obelix-project:
  git.latest:
    - name: https://github.com/jchassoul/obelix.git
    - target: /home/asterisk/obelix
    - rev: master
    - user: asterisk

obelix set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /home/asterisk/obelix/
        - require:
            - git: obelix-project