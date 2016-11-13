include:
    - requirements

/opt/venv/spider:
    virtualenv.managed:

        - requirements: salt://spider/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

spider-project:
  git.latest:
    - name: https://github.com/iofun/spider.git
    - target: /opt/spider
    - rev: master
    

spider set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /opt/spider/
        - require:
            - git: spider-project