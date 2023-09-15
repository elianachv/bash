#!bin/bash
# Programa para revisar declaracion de variables de programa

opcion=0
nombre=Eli

echo "Opcion $opcion y Nombre: $nombre"

# Pasando una variable a otro archivo o procesp
# Exportar variable nombre
export nombre

# Llamar a otro script para recuperar variable
bash 2_variables.sh
