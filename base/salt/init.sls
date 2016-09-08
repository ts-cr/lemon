salt:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/saltstack/salt/ubuntu trusty main
    - file: /etc/apt/sources.list.d/salt.list
    - key_url: http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6
    - require_in:
      - pkg: salt-minion

  pkg.latest:
    - name: salt-minion
    - refresh: True