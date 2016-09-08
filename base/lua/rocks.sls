luarocks luasec:
    cmd.run: 
        - name: "luarocks install luasec && echo 'true' > /srv/rock-luasec" 
        - unless: "cat /srv/rock-luasec"

luarocks unsup:
    cmd.run: 
        - name: "luarocks install unsup && echo 'true' > /srv/rock-unsup" 
        - unless: "cat /srv/rock-unsup"

luarocks randomkit:
    cmd.run: 
        - name: "luarocks install randomkit && echo 'true' > /srv/rock-randomkit" 
        - unless: "cat /srv/rock-randomkit"

luarocks itorch:
    cmd.run: 
        - name: "luarocks install itorch && echo 'true' > /srv/rock-itorch" 
        - unless: "cat /srv/rock-itorch"

luarocks hdf5:
    cmd.run: 
        - name: "luarocks install hdf5 && echo 'true' > /srv/rock-hdf5" 
        - unless: "cat /srv/rock-hdf5"

luarocks hash:
    cmd.run: 
        - name: "luarocks install hash && echo 'true' > /srv/rock-hash" 
        - unless: "cat /srv/rock-hash"

luarocks totem:
    cmd.run: 
        - name: "luarocks install totem && echo 'true' > /srv/rock-totem" 
        - unless: "cat /srv/rock-totem"

luarocks pprint:
    cmd.run: 
        - name: "luarocks install pprint && echo 'true' > /srv/rock-pprint" 
        - unless: "cat /srv/rock-pprint"

luarocks lzmq:
    cmd.run: 
        - name: "luarocks install lzmq && echo 'true' > /srv/lua-lzmq"
        - unless: "cat /srv/lua-lzmq"

luarocks lzmq-ffi:
    cmd.run: 
        - name: "luarocks install lzmq-ffi && echo 'true' > /srv/rock-lzmq-ffi" 
        - unless: "cat /srv/rock-lzmq-ffi"

luarocks lyaml:
    cmd.run:
        - name: "luarocks install lyaml && echo 'true' > /srv/rock-lyaml" 
        - unless: "cat /srv/rock-lyaml"

luarocks turbo:
    cmd.run:
        - name: "luarocks install turbo && echo 'true' > /srv/rock-turbo" 
        - unless: "cat /srv/rock-turbo"

luarocks moonscript:
    cmd.run:
        - name: "luarocks install moonscript && echo 'true' > /srv/rock-moonscript" 
        - unless: "cat /srv/rock-moonscript"

luarocks lapis:
    cmd.run:
        - name: "luarocks install lapis && echo 'true' > /srv/rock-lapis" 
        - unless: "cat /srv/rock-lapis"

luarocks luafilesystem:
    cmd.run: 
        - name: "luarocks install luafilesystem && echo 'true' > /srv/rock-luafilesystem" 
        - unless: "cat /srv/rock-luafilesystem"

luarocks penlight:
    cmd.run: 
        - name: "luarocks install penlight && echo 'true' > /srv/rock-penlight" 
        - unless: "cat /srv/rock-penlight"

luarocks sundown:
    cmd.run: 
        - name: "luarocks install sundown && echo 'true' > /srv/rock-sundown" 
        - unless: "cat /srv/rock-sundown"

luarocks cwrap:
    cmd.run: 
        - name: "luarocks install cwrap && echo 'true' > /srv/rock-cwrap" 
        - unless: "cat /srv/rock-cwrap"

luarocks paths:
    cmd.run: 
        - name: "luarocks install paths && echo 'true' > /srv/rock-paths" 
        - unless: "cat /srv/rock-paths"

luarocks torch:
    cmd.run: 
        - name: "luarocks install torch && echo 'true' > /srv/rock-torch" 
        - unless: "cat /srv/rock-torch"

luarocks dok:
    cmd.run: 
        - name: "luarocks install dok && echo 'true' > /srv/rock-dok" 
        - unless: "cat /srv/rock-dok"

luarocks trepl:
    cmd.run: 
        - name: "luarocks install trepl && echo 'true' > /srv/rock-trepl" 
        - unless: "cat /srv/rock-trepl"

luarocks sys:
    cmd.run: 
        - name: "luarocks install sys && echo 'true' > /srv/rock-sys" 
        - unless: "cat /srv/rock-sys"

luarocks logroll:
    cmd.run: 
        - name: "luarocks install logroll && echo 'true' > /srv/rock-logroll" 
        - unless: "cat /srv/rock-logroll"

luarocks buffer:
    cmd.run: 
        - name: "luarocks install buffer && echo 'true' > /srv/rock-buffer" 
        - unless: "cat /srv/rock-buffer"

luarocks curl:
    cmd.run: 
        - name: "luarocks install curl && echo 'true' > /srv/rock-curl" 
        - unless: "cat /srv/rock-curl"

luarocks moses:
    cmd.run: 
        - name: "luarocks install moses && echo 'true' > /srv/rock-moses" 
        - unless: "cat /srv/rock-moses"

luarocks xlua:
    cmd.run: 
        - name: "luarocks install xlua && echo 'true' > /srv/rock-xlua" 
        - unless: "cat /srv/rock-xlua"

luarocks nn:
    cmd.run: 
        - name: "luarocks install nn && echo 'true' > /srv/rock-nn" 
        - unless: "cat /srv/rock-nn"

luarocks graph:
    cmd.run: 
        - name: "luarocks install graph && echo 'true' > /srv/rock-graph" 
        - unless: "cat /srv/rock-graph"

luarocks nngraph:
    cmd.run: 
        - name: "luarocks install nngraph && echo 'true' > /srv/rock-nngraph" 
        - unless: "cat /srv/rock-nngraph"

luarocks image:
    cmd.run: 
        - name: "luarocks install image && echo 'true' > /srv/rock-image" 
        - unless: "cat /srv/rock-image"

luarocks optim:
    cmd.run: 
        - name: "luarocks install optim && echo 'true' > /srv/rock-optim" 
        - unless: "cat /srv/rock-optim"

luarocks gnuplot:
    cmd.run: 
        - name: "luarocks install gnuplot && echo 'true' > /srv/rock-gnuplot" 
        - unless: "cat /srv/rock-gnuplot"

luarocks env:
    cmd.run: 
        - name: "luarocks install env && echo 'true' > /srv/rock-env" 
        - unless: "cat /srv/rock-env"

luarocks nnx:
    cmd.run: 
        - name: "luarocks install nnx && echo 'true' > /srv/rock-nnx" 
        - unless: "cat /srv/rock-nnx"

luarocks graphicsmagick:
    cmd.run: 
        - name: "luarocks install graphicsmagick && echo 'true' > /srv/rock-graphicsmagick" 
        - unless: "cat /srv/rock-graphicsmagick"

luarocks argcheck:
    cmd.run: 
        - name: "luarocks install argcheck && echo 'true' > /srv/rock-argcheck" 
        - unless: "cat /srv/rock-argcheck"

luarocks argparse:
    cmd.run: 
        - name: "luarocks install argparse && echo 'true' > /srv/rock-argparse" 
        - unless: "cat /srv/rock-argparse"

luarocks audio:
    cmd.run: 
        - name: "luarocks install audio && echo 'true' > /srv/rock-audio" 
        - unless: "cat /srv/rock-audio"

luarocks fftw3:
    cmd.run: 
        - name: "luarocks install fftw3 && echo 'true' > /srv/rock-fftw3" 
        - unless: "cat /srv/rock-fftw3"

luarocks signal:
    cmd.run: 
        - name: "luarocks install signal && echo 'true' > /srv/rock-signal" 
        - unless: "cat /srv/rock-signal"

luarocks md5:
    cmd.run: 
        - name: "luarocks install md5 && echo 'true' > /srv/lua-md5" 
        - unless: "cat /srv/lua-md5"

luarocks underscore:
    cmd.run: 
        - name: "luarocks install underscore && echo 'true' > /srv/lua-underscore" 
        - unless: "cat /srv/lua-underscore"

luarocks router:
    cmd.run: 
        - name: "luarocks install router && echo 'true' > /srv/lua-router" 
        - unless: "cat /srv/lua-router"

luarocks luasocket:
    cmd.run: 
        - name: "luarocks install luasocket && echo 'true' > /srv/lua-socket"
        - unless: "cat /srv/lua-socket"

luarocks uuid:
    cmd.run: 
        - name: "luarocks install uuid && echo 'true' > /srv/lua-uuid"
        - unless: "cat /srv/lua-uuid"

luarocks cjson:
    cmd.run: 
        - name: "luarocks install lua-cjson && echo 'true' > /srv/lua-cjson"
        - unless: "cat /srv/lua-cjson"

luarocks pgmoon:
    cmd.run: 
        - name: "luarocks install pgmoon && echo 'true' > /srv/lua-pgmoon"
        - unless: "cat /srv/lua-pgmoon"

luarocks lua-resty-memcached:
    cmd.run: 
        - name: "luarocks install lua-resty-memcached && echo 'true' > /srv/lua-resty-memcached"
        - unless: "cat /srv/lua-resty-memcached"

luarocks lua-resty-string:
    cmd.run: 
        - name: "luarocks install lua-resty-string && echo 'true' > /srv/lua-resty-string"
        - unless: "cat /srv/lua-resty-string"