#!/bin/sh

SOURCE='svg'
QRC="icomoon_free_${SOURCE}.qrc"
TARGET="./PyQt/icomoon_free_${SOURCE}"

echo '<RCC>' > "${QRC}"
echo '<qresource prefix="/" >' >> "${QRC}"

ls -1 ${SOURCE} | while read SVG; do
    echo "<file>${SOURCE}/${SVG}</file>" >> "${QRC}"
done

echo '  </qresource>' >> "${QRC}"
echo '</RCC>' >> "${QRC}"

pyrcc4.exe -py2 -o "${TARGET}_py2.py" "${QRC}"

pyrcc4.exe -py3 -o "${TARGET}_py3.py" "${QRC}"
