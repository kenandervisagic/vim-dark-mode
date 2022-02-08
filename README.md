# VIM-dark-mode
Prva verzija tekstualnog editora kofiguriranog za programiranje u C++.


Instalacija:

Po pokretanju Linux OS-a u nekom od prethodno predloženih okruženja, radi instalacije Docker paketa otvoriti Linux terminal i upisati sljedeće komande:

Instalacija docker okruženja:
```console
wget -qO- https://get.docker.com/ | sudo sh && \
sudo usermod -a -G docker $USER && \
sudo shutdown -r 0
```
Instalacija VIM tekstualnog editora:
```console
wget -q -O- https://raw.githubusercontent.com/kenandervisagic/vim-dark-mode/main/vim-dark-kenan/install | sudo bash
```

Kontejner je moguće pokretati putem komande:
```console
sudo -E start_container
```

Nakon što se kontejner starta potrebno je source-ati skriptu iz foldera opt1 na sljedeći način:
```shell
source /opt1/script.sh
```
Vim se sada u novom kontejneru pokreće komandom e1.


Instalacija TMUX-a nije neophodna, ali dosta olšksava rad u kontejneru.

TMUX:
```console
sudo apt-get update
sudo apt-get install tmux

cd ~/
gedit .bashrc
```
Zatim na kraj .bashrc file-a dodati sljedeci kod:

```shell
if [ -d "/opt1/" ]; then
   export TERM=xterm-256color
   source /opt1/script.sh
   [ -z "$TMUX" ] && exec tmux
fi
```
Ovime se automatizira navođenje source-a svaki put kada se kontejner pokrene, te više nije potrebno kucati:
source /opt1/script.sh




Program je za ličnu upotrebu. 




