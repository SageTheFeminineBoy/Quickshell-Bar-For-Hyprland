import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: power
    Rectangle {
        height: 30
        width: 35
        radius: 30
        color: colours.bgcolor
        Rectangle {
            id: powerbutton
            anchors.centerIn: parent
            color: colours.basecolor
            width: 20
            height: 20
            radius: 20
            Text {
                anchors.centerIn: parent
                color: colours.iconcolour
                text: ""
                font.pixelSize: fonts.iconsize
                MouseArea {
                    anchors.fill: parent
                    onClicked: powermenu.visible = !powermenu.visible
                }
            }
            PopupWindow {
                id: powermenu
                width: 150
                height: 170
                visible: false
                grabFocus: true
                anchor {
                    window: parent.window
                    item: power
                    edges: Edges.Bottom | Edges.Right
                    gravity: Edges.Left | Edges.Bottom
                    margins.right: -35
                    margins.top: 30
                }
                color: "transparent"
                Rectangle {
                    anchors.fill: parent
                    color: colours.bgcolor
                    radius: 20
                    clip: true
                    Rectangle {
                        anchors.centerIn: parent
                        radius: 15
                        color: colours.basecolor
                        width: 140
                        height: 160
                        ColumnLayout {
                            anchors {
                                fill: parent
                                margins: 10
                            }
                            spacing: 5

                            Button {
                                Layout.fillWidth: true
                                background: Rectangle {
                                    color: parent.hovered ? colours.powerhover : colours.basecolor
                                    radius: 15
                                    Behavior on color {
                                        ColorAnimation {
                                            duration: 200
                                        }
                                    }
                                }
                                contentItem: RowLayout {
                                    spacing: 25
                                    Text {
                                        text: ""
                                        color: colours.iconcolour
                                        font.pixelSize: 16
                                    }
                                    Text {
                                        text: "Shutdown"
                                        color: colours.iconcolour
                                        font.family: fonts.fontfamily
                                        font.pixelSize: 16
                                    }
                                }
                                onClicked: {
                                    powermenu.visible = false;
                                    Quickshell.execDetached(["sh", "-c", "systemctl poweroff"]);
                                }
                            }
                            Rectangle {
                                color: colours.dividercolor
                                width: 100
                                height: 2
                                radius: 2
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Button {
                                Layout.fillWidth: true
                                background: Rectangle {
                                    color: parent.hovered ? colours.powerhover : colours.basecolor
                                    radius: 15
                                    Behavior on color {
                                        ColorAnimation {
                                            duration: 200
                                        }
                                    }
                                }
                                contentItem: RowLayout {
                                    spacing: 25
                                    Text {
                                        text: ""
                                        color: colours.iconcolour
                                        font.pixelSize: 19
                                    }
                                    Text {
                                        text: "Restart"
                                        color: colours.iconcolour
                                        font.family: fonts.fontfamily
                                        font.pixelSize: 16
                                    }
                                }
                                onClicked: {
                                    powermenu.visible = false;
                                    Quickshell.execDetached(["sh", "-c", "systemctl reboot"]);
                                }
                            }
                            Rectangle {
                                color: colours.dividercolor
                                width: 100
                                height: 2
                                radius: 2
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Button {
                                Layout.fillWidth: true
                                background: Rectangle {
                                    color: parent.hovered ? colours.powerhover : colours.basecolor
                                    radius: 15
                                    Behavior on color {
                                        ColorAnimation {
                                            duration: 200
                                        }
                                    }
                                }
                                contentItem: RowLayout {
                                    spacing: 25
                                    Text {
                                        text: "󰗽"
                                        color: colours.iconcolour
                                        font.pixelSize: 19
                                    }
                                    Text {
                                        text: "Logout"
                                        color: colours.iconcolour
                                        font.family: fonts.fontfamily
                                        font.pixelSize: 16
                                    }
                                }
                                onClicked: {
                                    powermenu.visible = false;
                                    Quickshell.execDetached(["sh", "-c", "hyprctl dispatch exit"]);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
