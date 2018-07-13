#!/usr/bin/bash
#install.sh
install="no"
uninstall="no"
version=$(echo $PT_version | sed s/_/./g)
uninstall=$PT_uninstall
old=$(rpm -qa | grep "openjdk")
pacote="java-$version-openjdk"
yum install -y $pacote &> /dev/null

if [ "$?" == "0" ]; then
   echo "Instalado $pacote"
else
  echo "Problema na Instalado do $pacote"
fi

if [ "$uninstall" == "yes" ]; then
  rpm -e $old
  if [ "$?" == "0" ]; then
     echo "Desinstalado $old"
  else
     echo "Problema na Desinstalacao do $pacote"
  fi
fi

