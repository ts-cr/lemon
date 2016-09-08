include:
    - freeswitch

conf/vars.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/vars.xml
        - source: salt://freeswitch/config/conf/vars.xml
        - template: jinja

conf/sip_profiles/internal.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/sip_profiles/internal.xml
        - source: salt://freeswitch/config/conf/sip_profiles/internal.xml
        - template: jinja

conf/sip_profiles/external.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/sip_profiles/external.xml
        - source: salt://freeswitch/config/conf/sip_profiles/external.xml
        - template: jinja

conf/autoload_configs/acl.conf.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/autoload_configs/acl.conf.xml
        - source: salt://freeswitch/config/conf/autoload_configs/acl.conf.xml
        - template: jinja

conf/autoload_configs/lua.conf.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/autoload_configs/lua.conf.xml
        - source: salt://freeswitch/config/conf/autoload_configs/lua.conf.xml
        - template: jinja

conf/autoload_configs/modules.conf.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/autoload_configs/modules.conf.xml
        - source: salt://freeswitch/config/conf/autoload_configs/modules.conf.xml
        - template: jinja

conf/autoload_configs/switch.conf.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/autoload_configs/switch.conf.xml
        - source: salt://freeswitch/config/conf/autoload_configs/switch.conf.xml
        - template: jinja

conf/dialplan/default.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/dialplan/default.xml
        - source: salt://freeswitch/config/conf/dialplan/default.xml
        - template: jinja

conf/dialplan/public.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/dialplan/public.xml
        - source: salt://freeswitch/config/conf/dialplan/public.xml
        - template: jinja

conf/dialplan/default/00_asterisk_extensions.xml:
    file.managed:
        - name: /usr/local/freeswitch/conf/dialplan/default/00_asterisk_extensions.xml
        - source: salt://freeswitch/config/conf/dialplan/default/00_asterisk_extensions.xml
        - template: jinja

init.d/freeswitch:
    file.managed:
        - name: /etc/init.d/freeswitch
        - source: salt://freeswitch/config/init.d.config
        - mode: 700

update-rc.d freeswitch:
    cmd.run:
        - name: "update-rc.d freeswitch defaults"