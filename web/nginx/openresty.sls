include:
    - requirements

nginx-zmq:
  git.latest:
    - name: https://github.com/alticelabs/nginx-log-zmq.git
    - target: /usr/src/nginx-log-zmq
    - rev: master

openresty source:
  file:
    - managed
    - name: /usr/src/openresty-1.9.15.1.tar.gz
    - source: salt://source/openresty-1.9.15.1.tar.gz

untar openresty:
    cmd.run:
        - name: "tar -zxf openresty-1.9.15.1.tar.gz"
        - unless: "cat /srv/openresty"
        - cwd: /usr/src/
        - require:
            - file: openresty source

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

compile openresty:
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
            --add-module=/usr/src/nginx-log-zmq \
            && make && make install \
            && echo 'true' > /srv/openresty"
        - unless: "cat /srv/openresty"
        - cwd: /usr/src/openresty-1.9.15.1/
        - require:
            - cmd: untar openresty

openresty cli link:
    cmd.run: 
        - name: "ln -sf /usr/local/nginx/bin/resty /usr/local/bin/resty"