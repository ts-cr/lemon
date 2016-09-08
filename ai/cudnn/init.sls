{% set current_path = salt['environ.get']('PATH', '/bin:/usr/bin') %}

cuda repo:
  file:
    - managed
    - name: /usr/src/cuda-repo-ubuntu1404_7.5-18_amd64.deb
    - source: salt://source/cuda-repo-ubuntu1404_7.5-18_amd64.deb

lib cudnn:
  file:
    - managed
    - name: /usr/src/libcudnn5_5.0.5-1+cuda7.5_amd64.deb
    - source: salt://source/libcudnn5_5.0.5-1+cuda7.5_amd64.deb

lib cudnn dev:
  file:
    - managed
    - name: /usr/src/libcudnn5-dev_5.0.5-1+cuda7.5_amd64.deb
    - source: salt://source/libcudnn5-dev_5.0.5-1+cuda7.5_amd64.deb

install cuda repo:
    cmd.run:
        - name: "dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb && echo 'true' > /srv/cuda-repo"
        - unless: "cat /srv/cuda-repo"
        - cwd: /usr/src/
        - require:
            - file: cuda repo

install cuda:
    pkg.installed:
        - names:
          - cuda
        - require:
            - file: cuda repo

install libcudnn:
    cmd.run:
        - name: "dpkg -i libcudnn5_5.0.5-1+cuda7.5_amd64.deb && echo 'true' > /srv/libcudnn"
        - unless: "cat /srv/libcudnn"
        - cwd: /usr/src/
        - require:
          - pkg: cuda

install libcudnn-dev:
    cmd.run:
        - name: "dpkg -i libcudnn5-dev_5.0.5-1+cuda7.5_amd64.deb && echo 'true' > /srv/libcudnn-dev"
        - unless: "cat /srv/libcudnn-dev"
        - cwd: /usr/src/
        - require:
          - pkg: cuda

#luajit lib: yes the fucking path is missing but we got it up at the start of the file and shit.
#   environ.setenv:
#     - name: LUAJIT_LIB
#     - value: /usr/local/lib
#     - update_minion: True
#     - unless: "cat /srv/openresty"

#luajit inc:
#   environ.setenv:
#     - name: LUAJIT_INC
#     - value: /usr/local/include/luajit-2.1
#     - update_minion: True
#     - unless: "cat /srv/openresty"
