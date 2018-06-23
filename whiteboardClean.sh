#!/bin/bash

function usage() {
    cat << EOF
    Использование: $0 {имя вх. файла} {имя вых. файла}

    Пример: $0 example1.jpg output1.png

EOF
}
if [ $# -eq 0 ] ; then
    usage
    exit 1
fi

# Способ 1
convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"

# Способ 2
#convert "$1" \( +clone -blur 0x20 \) -compose Divide_Src -composite -normalize -level 10%,90% -deskew 40% -unsharp 0x5+2+0 "$2"
