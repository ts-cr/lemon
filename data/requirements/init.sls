{% set kernel_release = salt['grains.get']('kernelrelease', '') %}

data required packages:
    pkg.installed:
        - names:
            - build-essential
            - libssl-dev
            - python-dev
            - linux-headers-{{ kernel_release }}
            - uuid-dev
            - uuid
            - libcurl4-openssl-dev
            - odbcinst
            - unixodbc
            - unixodbc-dev
            - default-jre
