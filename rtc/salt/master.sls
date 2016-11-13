salt master:
    pkg.latest:
        - names: 
            - salt-master
            - salt-api
            - salt-cloud
        - refresh: True