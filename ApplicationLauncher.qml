import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    Rectangle {
        height: 30
        width: 35
        radius: 30
        color: colours.bgcolor
        Rectangle {
            id: applicationlauncher
            anchors.centerIn: parent
            color: colours.basecolor
            width: 20
            height: 20
            radius: 20
            Text {
                anchors.centerIn: parent
                color: colours.iconcolour
                text: ""
                font.pixelSize: fonts.iconsize
            }
        }
    }
}
