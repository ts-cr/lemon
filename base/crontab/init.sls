/etc/crontab:
    file.managed:
        - name: /etc/crontab
        - source: salt://crontab/config/crontab
		- template: jinja