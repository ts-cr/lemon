include:
    - requirements

/home/overlord/venv/cebus:
    virtualenv.managed:
        - user: overlord
        - requirements: salt://cebus/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv
            - pkg: libmemcached-dev
            - pkg: libmemcached-tools

cebus-project:
  git.latest:
    - name: https://github.com/iofun/cebus.git
    - target: /home/overlord/cebus
    - rev: master
    - user: overlord