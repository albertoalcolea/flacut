#! /bin/sh

USAGE="Usage: $0 FLAC_FILE CUE_FILE"


# Recogemos los argumentos con los que ha sido llamado
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



# Comprobamos que existen las dependencias necesarias
which cuebreakpoints > /dev/null
if [ ! $(echo $?) = 0 ] ; then
    echo "You need to install 'cuetools' to run this application"
    exit 2
fi

which cuetag > /dev/null
if [ ! $(echo $?) = 0 ] ; then
    echo "You need to install 'cuetools' to run this application"
    exit 2
fi

which lltag > /dev/null
if [ ! $(echo $?) = 0 ] ; then
    echo "You need to install 'lltag' to run this application"
    exit 2
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
