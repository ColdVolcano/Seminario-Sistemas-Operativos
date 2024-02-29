#!/usr/bin/bash
PS3="Elige una opción: "
opts=("Listar contenido" "Crear archivo de texto" "Comparar archivos de texto" "Ver uso de awk" "Ver uso de grep" "Salir")
select opt in "${opts[@]}"
do
  case "$opt" in
    "Listar contenido")
      echo "Ingresa la ruta"
      read path
      ls $path
      break
    ;;
    "Crear archivo de texto")
      echo "Ingresa el texto a escribir"
      read texto
      echo $texto > archivo.txt
      break
    ;;
    "Comparar archivos de texto")
      echo "Ingresa el nombre del primer archivo"
      read fileA
      echo "Ingresa el nombre del segundo archivo"
      read fileB
      diff $fileA $fileB
      break
    ;;
    "Ver uso de awk")
      awk -W help
      break
    ;;
    "Ver uso de grep")
      grep --help
      break
    ;;
    "Salir") break 2
    ;;
    *) echo "Opción no reconocida"
  esac
done
