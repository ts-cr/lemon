squirrel packages:
    pkg.installed:
        - names:
            - portaudio19-dev
            - libjack-jackd2-dev
            - python-wxgtk3.0

pip pyaudio:
  pip.installed:
    - names:
    	- pyaudio
    	- i3ipc

    - require:
      - pkg: squirrel packages