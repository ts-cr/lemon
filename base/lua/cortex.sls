torch-dataset:
  git.latest:
    - name: https://github.com/twitter/torch-dataset.git
    - target: /usr/src/torch-dataset
    - rev: master

luarocks dataset:
    cmd.run: 
        - name: "luarocks make && echo 'true' > /srv/torch-dataset"
        - unless: "cat /srv/torch-dataset"
        - cwd: /usr/src/torch-dataset/
        - require:
            - git: torch-dataset

luarocks autograd:
    cmd.run: 
        - name: "luarocks install autograd && echo 'true' > /srv/cortex-autograd" 
        - unless: "cat /srv/cortex-autograd"

luarocks ipc:
    cmd.run: 
        - name: "luarocks install ipc && echo 'true' > /srv/cortex-ipc" 
        - unless: "cat /srv/cortex-ipc"

luarocks distlearn:
    cmd.run: 
        - name: "luarocks install distlearn && echo 'true' > /srv/cortex-distlearn" 
        - unless: "cat /srv/cortex-distlearn"