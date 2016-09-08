include:
    - requirements

/home/overlord/venv/spider:
    virtualenv.managed:
        - user: overlord
        - requirements: salt://spider/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

spider-project:
  git.latest:
    - name: https://github.com/iofun/spider.git
    - target: /home/overlord/spider
    - rev: master
    - user: overlord

spider set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /home/overlord/spider/
        - require:
            - git: spider-project