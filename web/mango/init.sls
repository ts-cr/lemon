include:
    - requirements

/home/overlord/venv/mango:
    virtualenv.managed:
        - user: overlord
        - requirements: salt://mango/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv
            - pkg: libmemcached-dev
            - pkg: libmemcached-tools

mango-project:
  git.latest:
    - name: https://github.com/iofun/mango.git
    - target: /home/overlord/mango
    - rev: master
    - user: overlord