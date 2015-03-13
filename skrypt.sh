#!/bin/bash

#Skrypt do instalacji dodatkowych aplikacji dla Linux Mint 8
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program. If not, see <http://www.gnu.org/licenses/>.
#Copyright (C) 23.04.2010  mati75 & Linux Mint Poland team
#wersja 0.5

konfig() {
clear
powrot=powrot
while [ "$powrot" = powrot ] ; do

echo "\033[1mCo chcesz teraz zrobić?:\033[0m"
echo "1. Konfiguracja systemu"
echo "2. Instalacja programów"
echo "3. Zobacz naszą stronę"
echo "4. Nie możesz rozwiązać problemu - zapraszamy na nasze forum "
echo "5. O programie"
echo "0. Zakończ"
echo -n "Wybierz jedną z opcji: "

read ki
	clear
	case "$ki" in

1 )
con
powrot=powrot
;;

2 )
ins
powrot=powrot
;;

3 )
str
powrot=powrot
;;

4 )
forum
powrot=powrot
;;

5 )
inf
;;

0 )
pod
exit 0
;;
	* )
powrot=powrot
echo "\033[0;31mNieprawidłowe polecenie\033[0m\n"
sleep 1
	;;
esac
done
}

con() {
clear
powrot=powrot
while [ "$powrot" = powrot ] ; do

echo  "\033[1mKonfiguracja systemu Linux Mint 8\033[0m"
echo "1. Zainstaluj sterowniki do karty graficznej"
echo "2. Ustaw rozdzielczość ekranu"
echo "3. Skonfiguruj zaporę systemową "
echo "4. Zmień wygląd okien"
echo "0. Powrót do głównego menu"
echo -n "Wybierz jedną z opcji: "

read us
	clear
	case "$us" in

1 )
ster
powrot=powrot
;;

2 )
ekra
powrot=powrot
;;

3 )
firewall
powrot=powrot
;;

4 )
okna
powrot=powrot
;;

0 )
konfig
powrot=powrot
;;

	* )
powrot=powrot
echo "\033[0;31mNieprawidłowe polecenie\033[0m\n"
sleep 1
	;;

	esac 
done }

ins() {
powrot=powrot
while [ "$powrot" = powrot ] ; do

echo "\033[1mInstalacja oprogramowania\033[0m"
echo "1. Zaktualizuj system"
echo "2. Zainstaluj Wine"
echo "3. Zainstaluj dodatkowe czcionki"
echo "4. Zainstaluj narzędzia pakujące"
echo "5. Zainstaluj odtwarzacz filmów Totem i dodatki do obsługi filmów"
echo "6. Zainstaluj Sun xVM VirtualBox'a "
echo "7. Zainstaluj Kadu - komunikator sieci Gadu-Gadu"
echo "8. Zainstaluj komunikator Tlen.pl"
echo "9. Zainstaluj przeglądarkę internetową Opera"
echo "10. Zainstaluj pakiet internetowy Sea Monkey"
echo "11. Zainstaluj klient sieci irc - XChat"
echo "12. Zainstaluj multikomunikator - Pidgin"
echo "13. Zainstaluj conky - tekstowy informator o systemie"
echo "14. Zaistaluj Google Chrome"
echo "15. Czyszcznie systemu"
echo "0. Powrót do głównego menu"
echo "\033[0;31mUwaga! Ta cześć wymaga podania hasła, jeśli zostaniesz poproszony(na) podaj je\033[0m\n"
echo -n "Wybierz aplikacje do zainstalowania: "

read app
	clear
	case "$app" in

"1")
upda
powrot=powrot
;;

"2")
wine
powrot=powrot
;;

3 )
czci
powrot=powrot
;;

4 )
pac
powrot=powrot
;;

5 )
film
powrot=powrot
;;

6 )
vbox
powrot=powrot
;;

7 )
kadu
powrot=powrot
;;

8 )
tlen
powrot=powrot
;;

9 )
opera
powrot=powrot
;;

10 )
seamonkey
powrot=powrot
;;

11 )
xchat
powrot=powrot
;;

12 )
pid
powrot=powrot
;;

13 )
conky
powrot=powrot
;;

14 )
chrome
powrot=powrot
;;

15 )
clean
powrot=powrot
;;

0 )
konfig;;
	* )
echo "\033[0;31mNieprawidłowe polecenie\033[0m\n"
	;;

	esac 
done }


upda()  {
sudo apt-get update && sudo apt-get -y --force-yes dist-upgrade
}

wine() {
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F9CB8DB0;
sudo sh -c 'echo "#Wine
deb http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu karmic main" >> /etc/apt/sources.list';
sudo apt-get update && sudo apt-get install wine 
} 

czci() {
sudo apt-get -y --force-yes install ttf-mscorefonts-installer ttf-liberation
}

pac() {
sudo apt-get -y --force-yes install rar unrar p7zip-full p7zip-rar unace
}

film() {
sudo apt-get -y --force-yes install totem griffith
}

vbox() {
wget -q http://download.virtualbox.org/virtualbox/debian/sun_vbox.asc -O- | sudo apt-key add -;
sudo sh -c 'echo "#VirtualBox
deb http://download.virtualbox.org/virtualbox/debian karmic non-free" >> /etc/apt/sources.list'; 
sudo apt-get update && sudo apt-get -y --force-yes install virtualbox-3.1
}


kadu() {
sudo apt-get update && sudo apt-get -y --force-yes install kadu
}

tlen() {
if [ "i686" = `uname -m` ]; then
 wget http://j.o2.pl/idi/tlenlinux-7.0.1.63.bin; sudo sh tlenlinux-7.0.1.63.bin
elif [ "x86_64" = `uname -m` ]; then
 wget http://j.o2.pl/idi/tlenlinux64-7.0.1.63.bin; sudo sh tlenlinux64-7.0.1.63.bin
else
 echo -ne "\033[1mSkrypt obsługuje tylko 32 i 64 bitowego Minta.\033[0m"
fi
}

chrome() {
if [ "i686" = `uname -m` ]; then
 wget http://dl.google.com/dl/linux/direct/google-chrome-beta_current_i386.deb; sudo dpkg -i google-chrome-beta_current_i386.deb
elif [ "x86_64" = `uname -m` ]; then
 wget http://dl.google.com/dl/linux/direct/google-chrome-beta_current_amd64.deb; sudo dpkg -i google-chrome-beta_current_amd64.deb
else
 echo -ne "\033[1mSkrypt obsługuje tylko 32 i 64 bitowego Minta.\033[0m"
fi
}
ster() {
/usr/bin/jockey-gtk
}

ekra() {
lxrandr
}

okna() {
lxappearance
}

firewall() { 
gksu gufw
}

inf() {

echo "\033[1m Skrypt konfiguracjno-instalacyjny dla Linux Mint 8 Helena LXDE CE \033[0m "
echo "
Wersja: 0.5
Autor: mati75 & Linux Mint Poland Team
Współpraca: sir_lucjan
Licencja: Gnu GPL v3

Za pomocą tego skryptu zainstalujesz programy najcześciej używane i polecane
przez społeczność. Również za jego pomocą skonfigurujesz system.

Serdeczne podziękowania dla devilroot.pl za hosting i serwer dla repozytorium.

Masz problem pisz na naszym forum http://www.forum.linuxmint.pl 
lub kanale irc #linuxmint-pl w sieci freenode"
read enter;
clear;
$konfig
}

opera() {
sudo apt-get -y --force-yes install opera
}

seamonkey() {
sudo apt-get -y --force-yes install seamonkey
} 

xchat() {
sudo apt-get -y --force-yes install xchat
}

pid() {
sudo apt-get --force-yes install pidgin
}

conky() {
sudo apt-get -y --force-yes install conky-all
}

clean() {
sudo apt-get autoremove &&  sudo apt-get clean && sudo apt-get autoclean
}

str() {
x-www-browser http://www.linuxmint.pl
}

forum() {
x-www-browser http://www.forum.linuxmint.pl
}

wyk() {
echo  "\033[0;34mWykonane\033[0m\n"
sleep 1
}

pod() {
echo "\033[0;34mDziękujemy za wybranie naszego systemu. Życzymy udanej pracy.\033[0m\n"
sleep 1
}

echo "\033[1;32m
  waawaawawaawawaa% 
  WQQQQQQWQQQQWQWQQmc           Skrypt konfiguracjno-instalacyjny
  WQQQQQQQQQQQQQQQQQQp.         dla Linux Mint 8 Helena LXDE CE
  WQQQWQWQWQQQQQQQQQWQp  
  QWQQQW  QQQQWQQQQQQQQz        Powered by mati75 & Linux Mint Poland team
  WWQQQ#  QQQWUWWWVWWQQQ        http://www.linuxmint.pl 
  QWQQQ#  QQF       4QWQc       Wersja: 0.5
  YYVQQ#  QD         QQQL	Copyright (C) 2010
     QQW  Qk.)Qc.]Qc 3QQC
    3QQ#  QC.]QC-]Q( jQQC
     QQ#  Qk.]QC.jQc 3QQC       Czy chcesz uruchomić program? [T]ak, [N]ie
    3QQW  QC.]QC.]Q  jQQC       
     QQ#  Qk:]QC:jQ  jQQC
    3QQm  WQQQQQQQQ  jQQC
     QQQ  3QWQQQQWE  dQQC
     QWQL            QQQC
     WWQQa          mQQQC
      QWQQmgwgwggwm#SUuWC
       QWQQQQQQQQQQk3o3QC
        QQQQQQQQQQQkmW?SC
          HW#WW#W#W#W##Wf


\033[0m"
read start
case $start in
 t | T | tak | Tak | TAK ) konfig;; 
 n | N | nie | Nie | NIE )  exit;;
* )  echo "\033[1mNiepoprawne polecenie\033[0m"; echo "\033[1m 3...\033[0m"; sleep 0.5; echo "\033[1m 2...\033[0m"; sleep 0.5; echo "\033[1m 1...\033[0m" ;;
esac
