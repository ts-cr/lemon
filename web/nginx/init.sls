nginx:
    user.present

/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://nginx/conf/nginx.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644

/etc/nginx/conf.d:
    file.directory:
        - user: www-data
        - group: www-data
        - recurse:
            - user
            - group

nginx-sysvinit:
  git.latest:
    - name: https://github.com/iofun/nginx-sysvinit-script.git
    - target: /usr/src/nginx-sysvinit
    - rev: master

make nginx-sysvinit:
    cmd.run: 
        - name: "make"
        - user: root
        - cwd: /usr/src/nginx-sysvinit/
        - require:
            - git: nginx-sysvinit