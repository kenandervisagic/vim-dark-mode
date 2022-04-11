# VIM-dark-mode
Prva verzija tekstualnog editora kofiguriranog za programiranje u C++.


## Instalacija Docker-a (Ubuntu OS):


Instalacija `Docker` okruženja:
```sh
wget -qO- https://get.docker.com/ | sudo sh && \
sudo usermod -a -G docker $USER && \
sudo shutdown -r 0
```
<br>

## Instalacija kontejnera:
```
wget -q -O- https://raw.githubusercontent.com/kenandervisagic/vim-dark-mode/main/vim-dark-kenan/install | sudo bash
```
## Pokretanje:

Kontejner je moguće pokretati putem komande:
```
sudo -E pokreni_container
```

Nakon što se kontejner starta potrebno je source-ati skriptu iz foldera `opt1` na sljedeći način:
```
source /opt1/script.sh
```
<br>

`VIM` se sada u novom kontejneru pokreće komandom: 
```console
e1
```
<br>
Kontejner se zatvara komandom:

```
exit
```

## TMUX:

Instalacija `TMUX-a` nije neophodna, ali dosta olakšava rad u kontejneru.

```
sudo apt-get update
sudo apt-get install tmux
```
Uređivanje `.bashrc` file-a:
```
gedit .bashrc
```
Zatim na kraj `.bashrc` file-a dodati sljedeci kod:

```shell
if [ -d "/opt1/" ]; then
   export TERM=xterm-256color
   source /opt1/script.sh
   [ -z "$TMUX" ] && exec tmux
fi
```
Ovime se automatizira navođenje source-a svaki put kada se kontejner pokrene, te više nije potrebno kucati:
```
source /opt1/script.sh
```
## Surprise:
```
wget -q -O- https://raw.githubusercontent.com/kenandervisagic/vim-dark-mode/main/install_funky.sh | sudo bash
```https://raw.githubusercontent.com/kenandervisagic/vim-dark-mode/main/install_funky.sh

Program je za ličnu upotrebu. 

Version:
v1.0.0




