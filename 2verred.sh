#!/bin/bash
#erendira garcia jimarez
#declaracion de las opciones#
opcion=""
#ciclo del menu: do while-mientras#
while [ "$opcion" != "3" ] ; do 
echo "--------------------------------"
echo "1 -muestra las interfaces---"
echo "2 .configuracion----"
echo "3 .salir----"
echo "--------------------------------" 
#leer la opcion a ingresar#
read opcion
#case para las opciones #
case $opcion in
#el 1ero #si la desea crear un nuevo usuario
	"1")
	echo "las interfaces son: "
	sudo ip add
	echo "----------listo  D: "
	;;
	"2")
	echo "elige una forma a conectarte"
	echo "comprobado interfaces__"
	sudo ifconfig -a
	echo "________________________"

	echo "escribe el numero: "
	echo "------------------------"
	echo "1. ip dinamica"
	echo "2. ip estatica"
	read red
	if [red -eq 1];then
	echo "editar el documento interface--"
	echo "agrega la ultima linea como el ejemplo:"
	echo "# Configuración de dirección IP dinámica para el interfaz 
	#etho es el nombre de la interfaz# 	
	eth0
	auto eth0
	iface eth0 inet dhcp"
	echo "------------------------"
	sudo nano /etc/network/interfaces
	echo "------------------------"	
	echo "listo" 
	sudo /etc/init.d/networking restart
	sudo ifconfig eth0 down
	sudo ifconfig eth0 up
	echo "por ultimo el ping"
	echo "conectividad---"
	echo "escribe una ip"
	ping -c 3 $ip
	echo "coneccion a internet--"
	ping google.com
	elif[red -eq 2];then
	echo "edita el archivo y agraega
	# Static IP address
	#esccribe lainterfaz a modificar en lugar de eth0#
	auto eth0
	iface eth0 inet static
	        address 192.168.1.100
	        netmask 255.255.255.0
	        network 192.168.1.0
	        broadcast 192.168.1.255
	        gateway 192.168.1.1
	"
	echo "claro modificalas a tus nesidades"
	echo "----------------------------------"
	sudo nano /etc/network/interfaces
	echo "listo"
	echo "tambien modifica servername dale una ip que tu quieras"
	echo "ejemplo:
	#dentro del documento#
	domain localdomain
	search localdomain
	nameserver 192.168.1.1"
	echo "-------------------------"
	sudo nano /etc/resolv.conf
	echo "escribe el nombre de la interfaz a modificar:wlp2s0  o enpsl0"
	read ip
	ifdown $ip
	ifup $ip
	echo "verificacion---"
	sudo ifconfig
	ping -c 3 www.debian.org	
	echo "listo---"
	;;
	"3")
	echo "adios, que bien que estubistes aqui, hasta la proxima..."
	;;
	*)
	echo "---    la opcion no es valida   ---"
	;;
	esac
done
