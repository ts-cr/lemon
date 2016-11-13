lua packages:
    pkg.installed:
        - names:
            - libzmq3-dev
            - libgraphicsmagick1-dev
            - libfftw3-dev
            - sox
            - libsox-dev
            - libsox-fmt-all
            - libreadline-dev
            - libjpeg-dev
            - libpng-dev
            - ncurses-dev
            - imagemagick
            - gfortran
            - unzip
            - gnuplot
            - gnuplot-x11
            - ipython
            - libopenblas-dev
            - liblapack-dev
            - libhdf5-dev
            - lua5.1
            - liblua5.1-0
            - liblua5.1-0-dev


# The follow copy is hardwire with lua 5.1 and is considered a hack, for JIT magic we need to fix it.
# We need to test the previous message from the past, we're on JIT now and everything appears to be fine.

# lol... so now were jit ready and everytime it's ok?... right?.. hmm!
lualib link:
    cmd.run: 
        - name: "ln -sf /usr/lib/x86_64-linux-gnu/liblua5.1.so /usr/lib/liblua.so"

move resty-upload:
    cmd.run:
        - name: "cp /usr/src/lua-resty-upload/lib/resty/upload.lua /usr/local/share/lua/5.1/resty/ && echo 'true' > /srv/lua-resty-upload"
        - unless: "cat /srv/lua-resty-upload"
        - require:
            - pkg: lua packages

lua-resty-upload:
  git.latest:
    - name: https://github.com/openresty/lua-resty-upload.git
    - target: /usr/src/lua-resty-upload
    - rev: master

luajit source:
    git.latest:
        - name: https://github.com/LuaJIT/LuaJIT.git
        - target: /usr/src/luajit
        - rev: v2.1

compile luajit:
    cmd.run: 
        - name: "make && make install"
        - unless: which luajit
        - cwd: /usr/src/luajit/
        - require:
            - git: luajit source

luajit link:
    cmd.run: 
        - name: "ln -sf luajit-2.1.0-beta2 /usr/local/bin/luajit"
        - unless: which luajit
        - cwd: /usr/src/luajit/
        - require:
            - cmd: compile luajit

luajit rocks:
    git.latest:
        - name: https://github.com/keplerproject/luarocks.git
        - target: /usr/src/jitrocks
        - unless: cat /srv/jitrocks
        - rev: master

configure jitrocks:
    cmd.run:
        - name: "./configure --lua-suffix=jit --with-lua-include=/usr/local/include/luajit-2.1"
        - unless: "cat /srv/jitrocks"
        - cwd: /usr/src/jitrocks/
        - require:
            - git: luajit rocks

make jitrocks:
    cmd.run:
        - name: "make build && make install && echo 'true' > /srv/jitrocks"
        - unless: "cat /srv/jitrocks"
        - cwd: /usr/src/jitrocks/
        - require:
            - cmd: configure jitrocks

config.lua:
    file.managed:
        - name: /usr/local/etc/luarocks/config-5.1.lua
        - source: salt://lua/config/config-5.1.lua