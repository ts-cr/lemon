{% set kernel_release = salt['grains.get']('kernelrelease', '') %}

asterisk packages:
    pkg.installed:
        - names:
            - build-essential
            - libssl-dev
            - python-dev
            - libncurses5-dev
            - libnewt-dev
            - libxml2-dev
            - linux-headers-{{ kernel_release }}
            - libsqlite3-dev
            - uuid-dev
            - uuid
            - libcurl4-openssl-dev
            - odbcinst
            - unixodbc
            - unixodbc-dev
            - libsrtp0-dev
            - libgmime-2.6-dev
            - libspeexdsp-dev
            - speex
            - libspeex-dev
            - liblua5.1-dev

freeswitch packages:

    pkg.installed:
        - names:
             - unixodbc-dev
             - autoconf
             - automake
             - devscripts
             - bison
             - libcurl4-openssl-dev
             - gawk 
             - g++
             - git
             - git-core
             - libjpeg-dev
             - libncurses5-dev
             - libncurses-dev
             - libopus-dev
             - libsndfile-dev
             - libtool
             - make
             - gawk
             - libogg-dev
             - pkg-config
             - libtiff5-dev
             - libperl-dev
             - uuid-dev
             - libgdbm-dev
             - libdb-dev
             - libx11-dev
             - python-dev
             - gettext
             - libperl-dev
             - libssl-dev
             - libgdbm-dev
             - libtiff4-dev
             - libcurl4-openssl-dev
             - libpcre3-dev
             - libdb-dev 
             - libspeex-dev
             - libspeexdsp-dev
             - libasound2-dev
             - libsqlite3-dev
             - libvorbis-dev
             - libzrtpcpp-dev
             - zlib1g-dev
             - libexpat1-dev
             - libedit-dev
             - gnutls-dev
             - libldns-dev
             - yasm

rtpengine packages:
    pkg.installed:
        - names:
             - dkms
             - dpkg-dev
             - debhelper
             - iptables-dev
             - libglib2.0-dev
             - libpcre3-dev
             - libxmlrpc-core-c3-dev
             - markdown
             - libhiredis-dev
             - libevent-dev
             - libpcap-dev

starfruit required packages:
    pkg.installed:
        - names:
            - python-virtualenv
            - python-dev
            - python-pip
            - libatlas-dev
            - libatlas3-base
            - libpng12-dev
            - libfreetype6
            - libfreetype6-dev
            - g++
            - libzmq3-dev
            - liblapack-dev
            - gfortran
            - build-essential
            - libpq-dev
