# get oh-my-zsh
oh-my-zsh-project:
  git.latest:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - target: /usr/src/oh-my-zsh
    - rev: master

# git set-upstream
oh-my-zsh set-upstream:
    cmd.run: 
        - name: "git branch --set-upstream-to origin/master"
        - cwd: /usr/src/oh-my-zsh/
        - require:
            - git: oh-my-zsh-project

# install zsh