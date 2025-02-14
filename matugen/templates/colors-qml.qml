import QtQuick

QtObject {
<* for name, value in colors *>
readonly property string {{name}}: "{{value.default.hex}}"
<* endfor *>
}
