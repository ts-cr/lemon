include:
    - requirements

/home/asterisk/venv/starfruit:
    virtualenv.managed:
        - user: asterisk
        - requirements: salt://starfruit/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

starfruit-project:
  git.latest:
    - name: https://github.com/iofun/starfruit.git
    - target: /home/asterisk/starfruit
    - rev: master
    - user: asterisk

starfruit set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /home/asterisk/starfruit/
        - require:
            - git: starfruit-project