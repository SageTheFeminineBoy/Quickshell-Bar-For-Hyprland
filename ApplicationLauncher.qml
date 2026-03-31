import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    Rectangle {
        id: applicationlauncher
        color: colours.basecolor
        width: 20
        height: 20
        radius: 7
        Text {
            anchors.centerIn: parent
            color: colours.iconcolour
            text: ""
            font.pixelSize: fonts.iconsize
        }
    }
}
