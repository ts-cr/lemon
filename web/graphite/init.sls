include:
    - requirements

/opt/venv/graphite:
    virtualenv.managed:
        - requirements: salt://graphite/requirements.txt
        - require:
            - pkg: python-dev
            - pkg: python-pip
            - pkg: python-virtualenv

graphite/wsgi.py:
    file.managed:
        - name: /opt/graphite/webapp/wsgi.py
        - source: salt://graphite/source/wsgi.py
        - template: jinja

graphite/local_settings.py:
    file.managed:
        - name: /opt/graphite/webapp/graphite/local_settings.py
        - source: salt://graphite/source/local_settings.py
        - template: jinja

carbon/carbon.conf:
    file.managed:
        - name: /opt/graphite/conf/carbon.conf
        - source: salt://graphite/conf/carbon.conf
        - template: jinja

carbon/storage-schemas.conf:
    file.managed:
        - name: /opt/graphite/conf/storage-schemas.conf
        - source: salt://graphite/conf/storage-schemas.conf
        - template: jinja

carbon/storage-aggregation.conf:
    file.managed:
        - name: /opt/graphite/conf/storage-aggregation.conf
        - source: salt://graphite/conf/storage-aggregation.conf
        - template: jinja