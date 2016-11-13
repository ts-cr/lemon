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

nginx-misc source:
  file:
    - managed
    - name: /usr/src/set-misc-nginx-module-0.31.tar.gz
    - source: salt://source/set-misc-nginx-module-0.31.tar.gz

nginx-lua source:
  file:
    - managed
    - name: /usr/src/lua-nginx-module-0.10.6.tar.gz
    - source: salt://source/lua-nginx-module-0.10.6.tar.gz

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

nginx-postgres source:
  file:
    - managed
    - name: /usr/src/ngx_postgres-1.0rc7.tar.gz
    - source: salt://source/ngx_postgres-1.0rc7.tar.gz

nginx-json source:
  file:
    - managed
    - name: /usr/src/rds-json-nginx-module-0.14.tar.gz
    - source: salt://source/rds-json-nginx-module-0.14.tar.gz

nginx-resty source:
  file:
    - managed
    - name: /usr/src/resty-cli-0.13.tar.gz
    - source: salt://source/resty-cli-0.13.tar.gz

nginx source:
  file:
    - managed
    - name: /usr/src/nginx-1.11.5.tar.gz
    - source: salt://source/nginx-1.11.5.tar.gz

untar nginx:
    cmd.run:
        - name: "tar -zxf nginx-1.11.5.tar.gz"
        - unless: "cat /srv/custom-nginx"
        - cwd: /usr/src/
        - require:
            - file: nginx source

untar nginx-lua:
    cmd.run:
        - name: "tar -zxf lua-nginx-module-0.10.6.tar.gz"
        - unless: "cat /srv/custom-nginx"
        - cwd: /usr/src/
        - require:
            - file: nginx-lua source

untar nginx-srcache:
    cmd.run:
        - name: "tar -zxf srcache-nginx-module-0.30.tar.gz"
        - unless: "cat /srv/custom-nginx"
        - cwd: /usr/src/
        - require:
            - file: nginx-srcache source

untar nginx-memc:
    cmd.run:
        - name: "tar -zxf memc-nginx-module-0.16.tar.gz"
        - unless: "cat /srv/custom-nginx"
        - cwd: /usr/src/
        - require:
            - file: nginx-memc source

untar nginx-postgres:
    cmd.run:
        - name: "tar -zxf ngx_postgres-1.0rc7.tar.gz"
        - unless: "cat /srv/custom-nginx"
        - cwd: /usr/src/
        - require:
            - file: nginx-postgres source

untar nginx-resty:
    cmd.run:
        - name: "tar -zxf resty-cli-0.13.tar.gz"
        - unless: "which resty"
        - cwd: /usr/src/
        - require:
            - file: nginx-resty source

nginx resty-cli link:
    cmd.run: 
        - name: "ln -sf /usr/src/resty-cli-0.13/bin/resty /usr/local/bin/resty"
        - require:
            - cmd: untar nginx-resty

untar nginx-json:
    cmd.run:
        - name: "tar -zxf rds-json-nginx-module-0.14.tar.gz"
        - unless: "cat /srv/custom-nginx"
        - cwd: /usr/src/
        - require:
            - file: nginx-json source

untar nginx-misc:
    cmd.run:
        - name: "tar -zxf set-misc-nginx-module-0.31.tar.gz"
        - unless: "cat /srv/custom-nginx"
        - cwd: /usr/src/
        - require:
            - file: nginx-json source

luajit lib:
   environ.setenv:
     - name: LUAJIT_LIB
     - value: /usr/local/lib
     - update_minion: True
     - unless: "cat /srv/custom-nginx"

luajit inc:
   environ.setenv:
     - name: LUAJIT_INC
     - value: /usr/local/include/luajit-2.1
     - update_minion: True
     - unless: "cat /srv/custom-nginx"

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
            --with-debug \
            --with-ipv6 \
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
            --add-module=/usr/src/set-misc-nginx-module-0.31 \
            --add-module=/usr/src/rds-json-nginx-module-0.14 \
            --add-module=/usr/src/nginx-log-zmq \
            --add-module=/usr/src/srcache-nginx-module-0.30 \
            --add-module=/usr/src/memc-nginx-module-0.16 \
            --add-module=/usr/src/lua-nginx-module-0.10.6 \
            --add-module=/usr/src/ngx_postgres-1.0rc7 \
            && make && make install \
            && echo 'true' > /srv/custom-nginx"
        - unless: "cat /srv/custom-nginx"
        - cwd: /usr/src/nginx-1.11.5/
        - require:
            - cmd: untar nginx