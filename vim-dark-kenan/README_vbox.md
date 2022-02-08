## Instalacija FET-lab okruženja unutar VirtualBox-a

Za studente koji instaliraju `FET` lab okruženje na `Windows` OS-u unutar virtuelne mašine (VirtualBox), u `FET` [GDrive folderu](http://bit.ly/2nCRnkO) postavljena je virtuelna mašina sa unaprijed konfiguriranom optimiziranom instalacijom `Ubuntu`-a sa `XFCE` okruženjem (tzv. `Xubuntu`). 

Mašinu je nakon preuzimanja na lokalni računar moguće import-ovati direktno u `Virtualbox`, putem opcije `File -> Import Appliance`. 

Korisnički račun (user name) u mašini je: `fetz`, sa šifrom: `fetz`

Mašina dolazi sa već instaliranim `Docker`-om. Unutar terminala pokrenute virtuelne mašine, potrebno je preuzeti `FET` kontejner okruženje putem slijedeće komande: 

```bash
wget -qO- https://gitlab.com/amer.hasanovic/fet_base/raw/master/install_vbox | sudo bash
```

Potom je moguće pokretati kontejner unutar virtuelne mašine sa slijedećom komandom u terminalu:

```bash
start_container
```

Obratiti pažnju da pokretanje ne zahtijeva upotrebu `sudo` prefiksa, kao što je slučaj u `FET` laboratoriji, niti eventualne dodatne korake (source skripte) unutar kontejnera.

Studenti koji žele popraviti vizuelni izgled editora unutar virtuelne mašine mogu poduzeti dodatni korak instalacije `Powerline` fontova, putem slijedeće sekvence komandi unutar pokrenutog kontejnera (tj. nakon `start_container` komande).

```bash
git clone https://github.com/powerline/fonts ~/.fonts
fc-cache
```

Po instalaciji fontova, u postavkama `XUbuntu` terminal aplikacije, opcija: `Edit -> Preferences... -> Appearance -> Font`, odabrati jedan od `Powerline` fontova npr. `Inconsolata for Powerline`.

U slučaju da se u `XUbuntu` terminalu pojavljuju artefakti tokom rada u terminalu, instalirati alternativni terminal slijedećom sekvencom komandi u `XUbuntu` terminalu:

```bash
sudo apt-get update && sudo apt-get install rxvt-unicode-256color
wget https://gitlab.com/amer.hasanovic/fet_base/raw/master/Xresources -O ~/.Xresources
mkdir -p ~/.urxvt/ext
wget https://gitlab.com/amer.hasanovic/fet_base/raw/master/urxvt/ext/resize-font -O ~/.urxvt/ext/resize-font 
wget https://gitlab.com/amer.hasanovic/fet_base/raw/master/urxvt/ext/clipboard -O ~/.urxvt/ext/clipboard
xrdb ~/.Xresources
```

U budućnosti pokretati `RXVT Unicode` terminal radi izvršavanja `start_container` komande.
