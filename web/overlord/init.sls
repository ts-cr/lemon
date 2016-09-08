include:
    - requirements

/home/overlord/venv/overlord:
    virtualenv.managed:
        - user: overlord
        - requirements: salt://overlord/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv
            - pkg: libmemcached-dev
            - pkg: libmemcached-tools

overlord-project:
  git.latest:
    - name: https://github.com/iofun/overlord.git
    - target: /home/overlord/overlord
    - rev: master
    - user: overlord