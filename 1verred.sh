#!/bin/bash
#erendira garcia jimarez
#declaracion de las opciones#
opcion=""
#ciclo del menu: do while-mientras#
while [ "$opcion" != "9" ] ; do 
echo "-------   bienvenido   ---------"
echo "0 instalar ifconfig,iwconfig..."
echo "1 ver redes 1era"
echo "2 ver redes 2da"
echo "3 quitar modulo wlp2s0 inalambrica <athak"
echo "4 quitar modulo enpsl0 cableada <r8169"
echo "5 levantar modulo wlp2s0 inalambrica <athak"
echo "6 levantar modulo enpsl0 cableada <r8169"
echo "7 conectar red wlp2s0 inalambrica <athak"
echo "8 conectar red enpsl0 cableada <r8169"
echo "9 desconectar red wlp2s0 inalambrica <athak"
echo "10 desconectar red enpsl0 cableada <r8169"
echo "11 detalles de red wlp2s0 inalambrica <athak "
echo "12 detalles de red enpsl0 cableada <r8169 "
echo "13 se para la red inalambrica"
echo "14 se inicia la red inalambrica"
echo "15 establece de manera estatica el nameserver"
echo "16 roter"
echo "17 ver modulos"
echo "18 dhclient cableada"
echo "19 dhclient inalambrica"
echo "20 ver insterfaces"
echo "21 conectar wlan"
echo "22 dispositivos ligados inalambricos"
echo "23 escanear coneccion"

echo "9 salir "
echo "--------------------------------"
#leer la opcion a ingresar#
read opcion
#case para las opciones #
case $opcion in
#el 1ero #si la desea crear un nuevo usuario
	"0")
	echo "---intalando---" 
	sudo apt-get install wireless-tools
	;;
	"1")
	echo "muestra red con ifconfig" 
	sudo ifconfig
	;;
	"2")
	echo "muestra red con ip add"
	sudo ip add
	;;
	"3")
	echo "lo quita"
	rmmod athak
	;;
	"4")
	echo "lo quita"
	rmmod r8169
	;;
	"5")
	echo "lo pone"
	modprove athak
	;;
	"6")
	echo "lo pone"
	modprove r8169
	;;
	"7")
	echo "escribe la ip"
	read ip
	echo "escribe la mascara"
	read mascara	
	echo "conectando.."
	sudo ifconfig athak $ip netmask $mascara up
	echo "escribe el gatewait"
	read ga
	sudo route add default gw $ga 
	;;
	"8")
	echo "escribe la ip"
	read ip
	echo "escribe la mascara"
	read mascara	
	echo "conectando.."
	sudo ifconfig r8169 $ip netmask $mascara up
	echo "escribe el gatewait"
	read ga
	sudo route add default gw $ga 
	;;
	"9")
	echo "desconectando.."
	sudo ifconfig athak down
	;;
	"10")
	echo "decaonectando.."
	sudo ifconfig r8169 down
	;;
	"11")
	echo "los detalles son.."
	sudo ifconfig athak
	;;
	"12")
	echo "los detalles son.."
	sudo ifconfig r8169
	;;
	"13")
	echo "se esta parando network-manager"
	sudo systemctl stop network-manager
	echo "listo"
	;;
	"14")
	echo "se esta iniciando network_manager"
	sudo systemctl start network-manager
	echo "listo"
	;;
	"15")
	echo "establece de manera estatica el nameserver"
	echo "escribe el la ip del nameserver"
	read ipse
	sudo sed -i "3 s|$|=nameserver$ipse|" /etc/resolf.conf
	;;
	"16")
	echo "ver router"
	sudo roter -n
	;;
	"17")
	echo "los modulos son"
	sudo lspci
	;;
	"18")
	echo "dhclient cableada"
	sudo dhclient athak
	;;
	"19")
	echo "dhclient inalambrica"
	sudo dhclient r8169
	;;
	"20")
	echo "la lista es.."
	sudo nano /etc/network/interfaces 
	;;
	"21")
	echo "configurancion"
	sudo dhclient r8169
	;;
	"22")
	echo "----iwconfig----"
	sudo iwconfig
	;;
	"23")
	echo "--elige la red--"
	echo "--escribe que coneccion eliges--"
	echo "--1 cableada--"
	echo "--2 inalambrico--"
	read red
	if [red -eq 1];then
  	sudo iwlist athak scanning 
	elif[red -eq 2];then
	sudo iwlist r8169 scanning
	fi
	;;
	"24")
	echo "--crear rede--"
	*)
	echo "---    la opcion no es valida   ---"
	;;
	esac
done
