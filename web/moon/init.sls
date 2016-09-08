/home/overlord/moon:
  file.directory:
    - user:  overlord
    - name:  /home/overlord/moon
    - group: overlord

moon/upload.lua:
    file.managed:
        - name: /home/overlord/moon/upload.lua
        - source: salt://moon/source/upload.lua
        - template: jinja