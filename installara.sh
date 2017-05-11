#!/bin/bash
#*********************************#
#           INSTALLARA            #
#                                 #
#  Laravel Framework 5 Installer  #
#                                 #
#      Author: Dmitry Fomin       #
#                                 #
#*********************************#

# Set colour vars
white='\e[1;37m'
red='\e[1;31m'
orange='\e[38;5;209m'
cyan='\e[0;36m'
purple='\e[0;35m'
yellow='\e[0;33m'
spec='\e[38;5;203m'

# Menu (Title screen)
clear
echo
echo -e $white"                      #*********************************#"
echo -e $white"                      #                                 #"
echo -e $white"                      #           $red INSTALLARA $white          #"
echo -e $white"                      #                                 #"
echo -e $white"                      #     $orange Author: Dmitry Fomin       $white#"
echo -e $white"                      #                                 #"
echo -e $white"                      #*********************************#"
echo
echo -e $purple"                                       OPTIONS:"
echo
echo -e "                      $yellow 1)$white START INSTALLING"
echo -e "                      $yellow 2)$white QUIT"

# Options
echo
echo -ne $spec"installara> $white"
read option
if [ $option = 1 ];
 then
   echo
   echo -e $cyan"Step 1. Enter name of your project or domain name ([a-z0-9-.a-z]): $white"
   echo
   echo -ne $spec"installara> $white"
   read projectname
   if [ ! -z $projectname ];
    then
      echo
      echo -e $orange"Step 2. Enter Laravel Framework version ([~5.*0-9.*0-9]) to install it: $white"
      echo
      echo -ne $spec"installara> $white"
      read ver
      echo -e "$white ********* STARTING INSTALL... ***********"
      echo
      echo -e "$purple Project folder: $white $(pwd)/$projectname,$red Laravel:$white $ver"
      echo
      curl -sS https://getcomposer.org/installer | php
      php composer.phar create-project laravel/laravel $projectname "$ver"
      chmod -R 775 $projectname/storage/ && zenity --info --text "OK! Thanks for using Installara" && clear && exit
   else
    echo -e $red"Error! Empty name"
    sleep 0.9
    bash $(basename $0)
  fi
else
   zenity --info --text "Thanks for using Installara"
   clear
   exit
fi
