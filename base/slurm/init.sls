#slurm packages:
#    pkg.installed:
#        - names:
#            - munge
#            - slurm-wlm

#slurm/slurm.conf:
#    file.managed:
#        - name: /etc/slurm-llnl/slurm.conf
#        - source: salt://slurm/conf/slurm.conf
#        - template: jinja