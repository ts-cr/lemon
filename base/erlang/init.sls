erlang:
  pkgrepo.managed:
    - name: deb http://packages.erlang-solutions.com/ubuntu trusty contrib
    - file: /etc/apt/sources.list.d/erlang.list
    - key_url: http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc
    - require_in:
      - pkg: erlang

  pkg.latest:
    - name: erlang
    - refresh: True