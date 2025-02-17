#!/bin/bash

pid_script=$$ # Visualizar el PID del proceso
intentos=5 # Numero principal de intentos
limite=1 # Numero limite de intentos

# Primera fase para visualizar el PID
echo "Has entrado al script: $pid_script"
read -n1 -p "Pulsa una tecla..."

# -eq es igual
# -lt menor que
# -gt mayor que

# Sistema de advinar el PID (Bucle)
while [[ true ]]; do
	clear
	echo -e "Intentos: $intentos \n" # Visualizar el contador de intentos
	read -p "Indica el PID: " user_pid # Registra el numero que mete el usuario, se guarda en la variable "user_pid"
	if [[ $user_pid -eq $pid_script ]]; then # Igual que
		echo "Has acertado!"
		break
	elif [[ $intentos -eq $limite ]]; then # Supera los intentos
		echo "Intentos fallidos superados..."
		break
	elif [[ $user_pid -lt $pid_script ]]; then # Mayor que
		read -n1 -p "Vuelve a intentarlo... El PID es mayor"
		((intentos--))
		continue
	elif [[ $user_pid -gt $pid_script ]]; then # Menor que
		read -n1 -p "Vuelve a intentarlo... El PID es menor"
		((intentos--))
	fi
done
