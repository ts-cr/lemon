include:
    - requirements

/opt/venv/grapes:
    virtualenv.managed:

        - requirements: salt://grapes/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

grapes-project:
  git.latest:
    - name: https://github.com/machineio/grapes.git
    - target: /opt/grapes
    - rev: master
    
    - https_user: gitoverlord
    - https_pass: zxcqwe2016git