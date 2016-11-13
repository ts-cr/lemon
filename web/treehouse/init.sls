include:
    - requirements

/opt/venv/treehouse:
    virtualenv.managed:

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
    - target: /opt/treehouse
    - rev: master

build treehouse:
    cmd.run:
        - name: "make all"
        - cwd: /opt/treehouse/
        - user: root
        - require:
            - git: treehouse-project