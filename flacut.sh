#! /bin/sh

USAGE="Usage: $0 FLAC_FILE CUE_FILE"

if [ "$1" = "--help" ] ; then
    echo $USAGE
    exit 0
fi

if [ $# != 2 ] ; then
    echo $USAGE
    exit 1
else
    FFLAC="$1"
    FCUE="$2"
fi

# Cortamos el archivo flac en múltiples tracks según los índices del archivo cue.
echo
echo "Dividiendo fichero flac en multiples tracks"
echo
cuebreakpoints "$FCUE" | shnsplit -o flac "$FFLAC"

# Aplicamos las etiquetas tag a los archivos generados.
echo
echo "Aplicando tags a los tracks"
echo
cuetag "$FCUE" split-track*.flac

# Renombramos los arcivos
echo
echo "Renombrando tracks segun los tags asociados"
echo
lltag --yes --no-tagging --rename '%n - %t' `ls split-track*.flac`

exit 0
