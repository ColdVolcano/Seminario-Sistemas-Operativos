#!/usr/bin/bash
echo "Elige una opción:"
ops=("Listar contenido" "Crear archivo de texto" "Comparar archivos de texto" "Ver uso de awk" "Ver uso de grep" "Salir")
select op in "${op[@]}"
do
  case "$o" in
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
      grep -f $fileA $fileB
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
    *) echo "Opción no reconocida"
  esac
done