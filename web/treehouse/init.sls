include:
    - requirements

/home/overlord/venv/treehouse:
    virtualenv.managed:
        - user: overlord
        - requirements: salt://treehouse/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv
            - pkg: libmemcached-dev
            - pkg: libmemcached-tools

treehouse-project:
  git.latest:
    - name: https://github.com/iofun/treehouse.git
    - target: /home/overlord/treehouse
    - rev: master
    - user: overlord