#!/bin/bash

# Texto que quieres mostrar con el efecto
texto="NOSTROMO - SISTEMA DE DIAGNÓSTICO\n\
STATUS: OK\n\
CARGA DEL SISTEMA: 45%\n\
TIEMPO RESTANTE: 2 HORAS 15 MINUTOS\n\
ALERTA: SIN INCIDENTES\n\
INICIANDO SECUENCIA DE ACTIVACIÓN..."

# Velocidad de desplazamiento (en segundos)
velocidad=0.1

# Recorre cada línea del texto
while IFS= read -r linea; do
    # Recorre cada carácter de la línea
    for (( i=0; i<${#linea}; i++ )); do
        # Imprime un carácter a la vez
        echo -n "${linea:$i:1}"
        # Espera el tiempo definido
        sleep $velocidad
    done
    # Salto de línea al final de cada línea
    echo
done <<< "$texto"