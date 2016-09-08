sngrep:
  pkgrepo.managed:
    - name: deb http://packages.irontec.com/ubuntu trusty main
    - file: /etc/apt/sources.list.d/sngrep.list
    - key_url: http://packages.irontec.com/public.key
    - require_in:
      - pkg: sngrep

  pkg.latest:
    - name: sngrep
    - refresh: True