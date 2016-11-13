include:
    - requirements

/opt/venv/extractor:
    virtualenv.managed:
        - requirements: salt://extractor/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

extractor-project:
  git.latest:
    - name: https://github.com/machineio/extractor.git
    - target: /opt/extractor
    - rev: master
    
    - https_user: gitoverlord
    - https_pass: zxcqwe2016git

extractor set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /opt/extractor/
        - require:
            - git: extractor-project