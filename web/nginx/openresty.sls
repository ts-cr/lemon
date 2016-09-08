include:
    - requirements

nginx-zmq:
  git.latest:
    - name: https://github.com/alticelabs/nginx-log-zmq.git
    - target: /usr/src/nginx-log-zmq
    - rev: master

nginx-devel:
  git.latest:
    - name: https://github.com/simpl/ngx_devel_kit.git
    - target: /usr/src/nginx-devel
    - rev: master

nginx-lua source:
  file:
    - managed
    - name: /usr/src/lua-nginx-module-0.10.5.tar.gz
    - source: salt://source/lua-nginx-module-0.10.5.tar.gz

nginx-memc source:
  file:
    - managed
    - name: /usr/src/memc-nginx-module-0.16.tar.gz
    - source: salt://source/memc-nginx-module-0.16.tar.gz

nginx-srcache source:
  file:
    - managed
    - name: /usr/src/srcache-nginx-module-0.30.tar.gz
    - source: salt://source/srcache-nginx-module-0.30.tar.gz

nginx source:
  file:
    - managed
    - name: /usr/src/nginx-1.9.15.tar.gz
    - source: salt://source/nginx-1.9.15.tar.gz

untar nginx:
    cmd.run:
        - name: "tar -zxf nginx-1.9.15.tar.gz"
        - unless: "cat /srv/openresty"
        - cwd: /usr/src/
        - require:
            - file: nginx source

untar nginx-lua:
    cmd.run:
        - name: "tar -zxf lua-nginx-module-0.10.5.tar.gz"
        - unless: "cat /srv/openresty"
        - cwd: /usr/src/
        - require:
            - file: nginx-lua source

untar nginx-srcache:
    cmd.run:
        - name: "tar -zxf srcache-nginx-module-0.30.tar.gz"
        - unless: "cat /srv/openresty"
        - cwd: /usr/src/
        - require:
            - file: nginx-srcache source

untar nginx-memc:
    cmd.run:
        - name: "tar -zxf memc-nginx-module-0.16.tar.gz"
        - unless: "cat /srv/openresty"
        - cwd: /usr/src/
        - require:
            - file: nginx-memc source

luajit lib:
   environ.setenv:
     - name: LUAJIT_LIB
     - value: /usr/local/lib
     - update_minion: True
     - unless: "cat /srv/openresty"

luajit inc:
   environ.setenv:
     - name: LUAJIT_INC
     - value: /usr/local/include/luajit-2.1
     - update_minion: True
     - unless: "cat /srv/openresty"

compile nginx:
    cmd.run: 
        - name: "./configure \
                    --prefix=/usr/local/nginx \
                    --with-ld-opt='-Wl,-rpath,/usr/local/lib' \
                    --sbin-path=/usr/sbin/nginx \
                    --conf-path=/etc/nginx/nginx.conf \
                    --error-log-path=/var/log/nginx/error.log \
                    --http-log-path=/var/log/nginx/access.log \
                    --pid-path=/run/nginx.pid \
                    --user=nginx \
                    --group=nginx \
                    --with-pcre-jit \
                    --with-file-aio \
                    --with-ipv6 \
                    --with-debug \
                    --with-http_ssl_module \
                    --with-http_v2_module \
                    --with-http_realip_module \
                    --with-http_addition_module \
                    --with-http_xslt_module \
                    --with-http_image_filter_module \
                    --with-http_sub_module \
                    --with-http_gunzip_module \
                    --with-http_gzip_static_module \
                    --with-http_random_index_module \
                    --with-http_secure_link_module \
                    --with-http_degradation_module \
                    --with-http_stub_status_module \
                    --without-http_fastcgi_module \
                    --without-http_uwsgi_module \
                    --without-http_scgi_module \
                    --add-module=/usr/src/nginx-devel \
                    --add-module=/usr/src/nginx-log-zmq \
                    --add-module=/usr/src/srcache-nginx-module-0.30/ \
                    --add-module=/usr/src/memc-nginx-module-0.16/ \
                    --add-module=/usr/src/lua-nginx-module-0.10.5/ \
                    && make && make install \
                    && echo 'true' > /srv/openresty"
        - unless: "cat /srv/openresty"
        - cwd: /usr/src/nginx-1.9.15/
        - require:
            - cmd: untar nginx