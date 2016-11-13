include:
    - requirements

/opt/venv/mango:
    virtualenv.managed:
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
    - target: /opt/mango
    - rev: master
    