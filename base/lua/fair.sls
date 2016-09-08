fair-luaffi:
  git.latest:
    - name: https://github.com/facebook/luaffifb.git
    - target: /usr/src/fair-luaffi
    - rev: master

luarocks luaffifb:
    cmd.run: 
        - name: "luarocks make && echo 'true' > /srv/fair-luaffi"
        - unless: "cat /srv/fair-luaffi"
        - cwd: /usr/src/fair-luaffi/
        - require:
            - git: fair-luaffi

fair-fbnn:
  git.latest:
    - name: https://github.com/facebook/fbnn.git
    - target: /usr/src/fair-fbnn
    - rev: master

luarocks fbnn:
    cmd.run: 
        - name: "luarocks make rocks/fbnn-scm-1.rockspec && echo 'true' > /srv/fair-fbnn"
        - unless: "cat /srv/fair-fbnn"
        - cwd: /usr/src/fair-fbnn/
        - require:
            - git: fair-fbnn

# where are the other cuda fucking libs yo?