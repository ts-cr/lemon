/opt/moon:
  file.directory:
    - name:  /opt/moon

moon/upload.lua:
    file.managed:
        - name: /opt/moon/upload.lua
        - source: salt://moon/source/upload.lua
        - template: jinja