include:
    - requirements

/opt/venv/cebus:
    virtualenv.managed:

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
    - target: /opt/cebus
    - rev: master
    