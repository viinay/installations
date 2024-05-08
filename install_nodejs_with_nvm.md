

1] Download the nvm installation script from the project’s GitHub page (https://github.com/nvm-sh/nvm), you can use curl. Note that the version number may differ from what is highlighted here: 
```curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh```

2] ```bash install_nvm.sh```

2.1] open new session ie open new tab
 
3] ```nvm ls-remote```

4] ```nvm install v10.16.3```

5] ```nvm use v10.16.3```

6] ```node -v```


------------------
If on step 3 nvm is not found
1. check bashrc file in source directory : ```cd ~``` then ```vi .bashrc``` it should have ```export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion```

2. check ```echo $NVM_DIR``` it should point to your directory where nvm is intalled. For root user point the NVM_DIR to non-root users directory

3. If there is no .bashrc then create one. the file should be in ~ directory only
