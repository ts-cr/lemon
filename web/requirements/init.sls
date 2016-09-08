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

mango required packages:
    pkg.installed:
        - names:
            - python-virtualenv
            - python-dev
            - python-pip
            - libatlas-dev
            - libatlas3gf-base
            - libpng12-dev
            - libfreetype6
            - libfreetype6-dev
            - g++
            - libzmq3-dev
            - liblapack-dev
            - gfortran
            - build-essential
            - libpq-dev

nginx required packages:
    pkg.installed:
        - names:
            - build-essential
            - zlib1g-dev
            - libpcre3-dev
            - libssl-dev
            - libxslt1-dev
            - libxml2-dev
            - libgd2-xpm-dev
            - libgeoip-dev
            - libgoogle-perftools-dev
            - libperl-dev
