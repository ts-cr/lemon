salt:
  pkgrepo.managed:
    - name: deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main
    - file: /etc/apt/sources.list.d/salt.list
    - key_url: https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub
    - require_in:
      - pkg: salt-minion

  pkg.latest:
    - name: salt-minion
    - refresh: True