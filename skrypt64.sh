#!/bin/bash

#Skrypt do instalacji dodatkowych aplikacji dla Linux Mint 7 x64
#Udostępniony jest na licencji GNU GPL
#Copyright (C) 2009  mati75 & Linux Mint Poland team
#wersja 0.2.2

repo() {
sh -c 'echo "###Dodatkowe repozytoria
deb http://wine.budgetdedicated.com/apt jaunty main #WineHQ - Ubuntu 9.04 "Jaunty Jackalope"
deb-src http://archive.ubuntu.com/ubuntu/ jaunty main
deb http://download.virtualbox.org/virtualbox/debian jaunty non-free
deb http://linux.getdropbox.com/ubuntu jaunty main
deb-src http://linux.getdropbox.com/ubuntu jaunty main
deb-src http://ppa.launchpad.net/awn-testing/ppa/ubuntu jaunty main #awn
deb-src http://ppa.launchpad.net/banshee-team/ppa/ubuntu jaunty main #banshee
deb-src http://ppa.launchpad.net/norsetto/ppa/ubuntu jaunty main #conky
deb-src http://ppa.launchpad.net/patryk-prezu/ppa/ubuntu jaunty main #kadu
deb-src http://ppa.launchpad.net/tualatrix/ubuntu jaunty main #ubuntu-tweak
deb-src http://ppa.launchpad.net/c-korn/ppa/ubuntu jaunty main #vlc" >> /etc/apt/sources.list' 

wget -q http://wine.budgetdedicated.com/apt/387EE263.gpg -O- | sudo apt-key add -
wget -q http://download.virtualbox.org/virtualbox/debian/sun_vbox.asc -O- | sudo apt-key add -
gpg --keyserver subkeys.pgp.net --recv BF810CD5 && gpg --export --armor BF810CD5 | sudo apt-key add -
gpg --keyserver pgp.mit.edu --recv-keys 3565780E
gpg --keyserver subkeys.pgp.net --recv 6E80C6B7 && gpg --export --armor 6E80C6B7  | sudo apt-key add -
gpg --keyserver subkeys.pgp.net --recv 95628707 && gpg --export --armor 95628707 | sudo apt-key add -
gpg --no-default-keyring --keyring /tmp/patryk.keyring --keyserver keyserver.ubuntu.com --recv A8094D5F56AB88EDF434B1329761EDC37AB674BA && gpg --no-default-keyring --keyring /tmp/patryk.keyring --export --armor A8094D5F56AB88EDF434B1329761EDC37AB674BA | sudo apt-key add -
gpg --keyserver subkeys.pgp.net --recv 0624A220 && gpg --export --armor 0624A220  | sudo apt-key add -
gpg --keyserver keyserver.ubuntu.com --recv-keys 40130828 && gpg --export -a 40130828 | sudo apt-key add -
apt-get update
}

upda()  {
apt-get update && apt-get -y --force-yes dist-upgrade
}

czci() {
apt-get -y --force-yes install msttcorefonts
}

pac() {
apt-get -y --force-yes install rar unrar p7zip-full p7zip-rar unace
}

film() {
 apt-get -y --force-yes install totem griffith qnapi
}

kadu() {
 apt-get -y --force-yes install kadu
}

tlen() {
wget http://j.o2.pl/idi/tlenlinux64-7.0.1.41.bin; sh tlenlinux64-7.0.1.41.bin
}


opera() {
apt-get -y --force-yes install opera
}


seamonkey() {
apt-get -y --force-yes install seamonkey
} 

ban() {
 apt-get -y --force-yes install banshee
}


xchat() {
 apt-get -y --force-yes install xchat
}

pid() {
 apt-get --force-yes install pidgin
}

conky() {
 apt-get -y --force-yes install conky
}


xser() {
 apt-get -y --force-yes install dontzap
 dontzap -d
echo "\033[0;34mWyloguj i zaloguj się ponownie, aby nowe ustawienia zaczęły działać\033[0m\n"
sleep 2
}


clean() {
 apt-get autoremove &&  apt-get clean &&  apt-get autoclean
}

str() {
firefox http://www.linuxmint.pl
}

forum() {
firefox http://www.forum.linuxmint.pl
}


pod() {
echo "\033[0;34mDziękujemy za wybranie naszego systemu. Życzymy udanej pracy. Aby wprowadzić 
wszystkie zmiany należy uruchomić ponownie komputer.\033[0m\n"
sleep 1
}
main_loop=true
while [ "$main_loop" = true ] ; do

echo "\033[1mWitaj w instalatorze oprogramowaniu dla Linux Mint 7 x64 :\033[0m"
echo "\033[1;37;42mPowered by mati75 & Linux Mint Poland team|http://www.linuxmint.pl|Wersja:0.2.2|\033[0m"
echo "1. Dodaj dodatkowe repozytoria i klucze publiczne"
echo "2. Zaktualizuj system"
echo "\033[1mZainstaluj aplikacje:\033[0m"
echo "3. Zainstaluj dodatkowe czcionki"
echo "4. Zainstaluj narzędzia pakujące"
echo "5. Zainstaluj odtwarzacz filmów Totem i dodatki do obsługi filmów"
echo "6. Zainstaluj Kadu - komunikator sieci Gadu-Gadu"
echo "7. Zainstaluj komunikator Tlen.pl"
echo "8. Zainstaluj przeglądarkę internetową Opera"
echo "9. Zainstaluj pakiet internetowy Sea Monkey"
echo "10. Zainstaluj odtwarzacz muzyki Banshee"
echo "11. Zainstaluj klient sieci irc - XChat"
echo "12. Zainstaluj multikomunikator - Pidgin"
echo "13. Zainstaluj conky - tekstowy informator o systemie"
echo "14. Dostosuj system do netbooka"
echo "15. Włącz kombinację klawiszy Alt+Ctrl+Backspace do resetowania serwera X"
echo "\033[1mDodatkowe czynności:\033[0m"
echo "16. Czyszcznie systemu"
echo "17. Zobacz naszą stronę"
echo "18. Nie możesz rozwiązać problemu - zapraszamy na nasze forum "
echo "\033[1m--------------------------------------------------\033[0m"
echo "19. Zakończ"
echo -n "Wybierz czynność do wykonania: "

read option
	echo ""
	case "$option" in

1 )
repo
main_loop=true
;;


2 )
upda
main_loop=true
;;


3 )
czci
main_loop=true
;;

4 )
pac
main_loop=true
;;

5 )
film
main_loop=true
;;

6 )
kadu
main_loop=true
;;

7 )
tlen
main_loop=true
;;

8 )
opera
main_loop=true
;;

9 )
seamonkey
main_loop=true
;;

10 )
ban
main_loop=true
;;

11 )
xchat
main_loop=true
;;

12 )
pid
main_loop=true
;;

13 )
conky
main_loop=true
;;

14 )
netbook
main_loop=true
;;

15 )
xser
main_loop=true
;;


16 )
clean
main_loop=true
;;

17 )
str
main_loop=true
;;

18 )
forum
;;

19 )
pod
exit 0
;;
	* )
main_loop=true
echo -e "\033[0;31mNieprawidłowe polecenie\033[0m\n"
sleep 1
	;;

	esac
done
