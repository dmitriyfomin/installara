#!/usr/bin/env bash
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
orange='\e[0;29m'
cyan='\e[0;36m'
purple='\e[0;35m'
yellow='\e[0;33m'

# Menu (Title screen)
clear
echo
echo "                     $white #*********************************#"
echo "                     $white #                                 #"
echo "                     $white #           $red INSTALLARA           $white#"
echo "                     $white #                                 #"
echo "                     $white #     $orange Author: Dmitry Fomin       $white#"
echo "                     $white #                                 #"
echo "                     $white #*********************************#"
echo ""
echo "                                      $purple OPTIONS:"
echo
echo "                      $yellow 1)$white START INSTALLING"
echo "                      $yellow 2)$white QUIT"

# Options
read option
if [ $option = 1 ];
 then
   echo
   echo "$cyan Step 1. Enter name of your project or domain name ([a-z0-9-.a-z]): $white"
   read projectname
   if [ ! -z $projectname ];
    then
      echo "$orange Step 2. Enter Laravel Framework version ([~5.*0-9.*0-9]) to install it: $white"
      read ver
      echo "$white ********* STARTING INSTALL... ***********"
      echo
      echo "$purple Project folder: $white $(pwd)/$projectname,$red Laravel:$white $ver"
      echo
      curl -sS https://getcomposer.org/installer | php
      php composer.phar create-project laravel/laravel $projectname "$ver"
      chmod -R 775 $projectname/storage/
   else
    echo "$red Error! Empty name"
    sleep 0.9
    sh $(basename $0)
  fi
else
   exit
fi
