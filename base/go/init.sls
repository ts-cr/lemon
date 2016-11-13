# missing gopath !

go source:
  file:
    - managed
    - name: /usr/src/go1.7.1.linux-amd64.tar.gz
    - source: salt://source/go1.7.1.linux-amd64.tar.gz

untar go:
    cmd.run:
        - name: "tar -zxvf go1.7.1.linux-amd64.tar.gz -C /usr/local/"
        - unless: which go
        - cwd: /usr/src/

go link:
    cmd.run: 
        - name: "ln -sf /usr/local/go/bin/go /usr/local/bin/go"
        - unless: which go
        - require:
            - cmd: untar go