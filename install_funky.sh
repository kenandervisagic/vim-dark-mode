#!/bin/bash 
docker pull kenandervisagic/vim-dark-mode_funky:latest
wget 'https://raw.githubusercontent.com/kenandervisagic/vim-dark-mode/main/vim-dark-kenan/pokreni_container' -O /usr/local/bin/pokreni_container && chmod +x /usr/local/bin/pokreni_container
wget 'https://github.com/kenandervisagic/vim-dark-mode/raw/main/vim-dark-kenan/bin/fzy' -O /usr/local/bin/fzy && chmod +x /usr/local/bin/fzy
