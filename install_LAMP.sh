##!/bin/bash

#-------------------------------------------
#| Script automoatisant l'installation de  |
#| LAMP sur un Raspberry PI et phpmyadmin  |
#| Création des dossiers pointant vers WWW |
#| Activation de UFW et des règles         |
#|                                         |
#|                                         |
#| Version 1.0                             |
#| Contact : peuch.clement15@gmail.com     |
#|                                         |
#| Copyright : 2015, Peuch Clément         |
#| Destiné à un usage non commercial       |
#|                                         |
#-------------------------------------------


#Tests des droits
if [ $USER !="root" -o $UID != 0 ]
then
    echo "Ce script ne peut être exécuter que par l'administrateur"
    echo "Veuillez placer SUDO devant la commande "
    exit 1
fi


#Mise à jour du système et des paquets installés

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y


#Installation de LAMP + PHPMYADMIN

sudo apt-get install apache2 php5 mysql-server php5-mysql libapache-mod -php5 phpmyadmin -y
sudo ln -s /usr/share/phpmyadmin /var/www/phpmyadmin


#Création du dossier dans /home/pi pointant vers /var/wwww et de son lien

cd /home/pi
mkdir site
sudo ln -s site/ /var/www/site


#Activation du parefeu UFW

sudo apt-get install ufw -y
sudo ufw enable
sudo ufw allow 80 #Apache
sudo ufw allow 22 #SSH


#Redemarrage du système
sudo shutdown -r now
