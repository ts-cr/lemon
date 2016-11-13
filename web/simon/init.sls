include:
    - requirements

/opt/venv/simon:
    virtualenv.managed:

        - requirements: salt://simon/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv
            - pkg: libmemcached-dev
            - pkg: libmemcached-tools

simon-project:
  git.latest:
    - name: https://github.com/iofun/simon.git
    - target: /opt/simon
    - rev: master
    