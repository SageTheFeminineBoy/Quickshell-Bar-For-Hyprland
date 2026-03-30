import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

PanelWindow {

    QtObject {
        id: colours
        property color bgcolor: "#131315"
        property color basecolor: "#1f1f21"
        property color iconcolor: "#e6e6e6"
        property color workspaceactive: "#e6e6e6"
        property color workspaceinactive: "#505253"
        property color workspaceactiveicon: "#505253"
        property color workspaceinactiveicon: "#e6e6e6"
        property color currentdaycal: "#ffffff"
    }

    QtObject {
        id: fonts
        property int iconsize: 12
        property string fontfamily: "Adventurer"
    }

    anchors {
        top: true
        left: true
        right: true
    }
    margins {
        top: 5
        left: 5
        right: 5
    }
    surfaceFormat.opaque: false
    color: "transparent"
    height: 30

    Rectangle {
        anchors.fill: parent
        color: colours.bgcolor
        radius: 10
    }
    Rectangle {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 5
            leftMargin: 7.5
        }
        color: colours.basecolor
        width: 20
        height: 20
        radius: 7
        Text {
            anchors.centerIn: parent
            color: colours.iconcolor
            text: ""
            font.pixelSize: fonts.iconsize
        }
    }
    Rectangle {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 5
            leftMargin: 35
        }
        color: colours.basecolor
        width: 147.5
        height: 20
        radius: 7
        Rectangle {
            id: workspaceIndicator1
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 2.5
                leftMargin: 7.5
            }
            width: Hyprland.focusedWorkspace.id === 1 ? 35 : 25
            height: 15
            radius: 7
            color: Hyprland.focusedWorkspace.id === 1 ? colours.workspaceactive : colours.workspaceinactive
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Hyprland.dispatch("workspace 1")
                    }
            }
        }
        Rectangle {
            id: workspaceIndicator2
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 2.5
                leftMargin: {
                    switch (Hyprland.focusedWorkspace.id) {
                        case 1: return 50
                        case 2: return 40
                        case 3: return 40
                        case 4: return 40
                    }
                }
            }
            width: Hyprland.focusedWorkspace.id === 2 ? 35 : 25
            height: 15
            radius: 7
            color: Hyprland.focusedWorkspace.id === 2 ? colours.workspaceactive : colours.workspaceinactive
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Hyprland.dispatch("workspace 2")
                    }
            }
        }
        Rectangle {
            id: workspaceIndicator3
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 2.5
                leftMargin: {
                    switch (Hyprland.focusedWorkspace.id) {
                        case 1: return 82.5
                        case 2: return 82.5
                        case 3: return 72.5
                        case 4: return 72.5
                    }
                }
            }
            width: Hyprland.focusedWorkspace.id === 3 ? 35 : 25
            height: 15
            radius: 7
            color: Hyprland.focusedWorkspace.id === 3 ? colours.workspaceactive : colours.workspaceinactive
             MouseArea {
                anchors.fill: parent
                onClicked: {
                    Hyprland.dispatch("workspace 3")
                    }
            }
        }
        Rectangle {
            id: workspaceIndicator4
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 2.5
                leftMargin: {
                    switch (Hyprland.focusedWorkspace.id) {
                        case 1: return 115
                        case 2: return 115
                        case 3: return 115
                        case 4: return 105
                    }
                }
            }
            width: Hyprland.focusedWorkspace.id === 4 ? 35 : 25
            height: 15
            radius: 7
            color: Hyprland.focusedWorkspace.id === 4 ? colours.workspaceactive : colours.workspaceinactive
             MouseArea {
                anchors.fill: parent
                onClicked: {
                    Hyprland.dispatch("workspace 4")
                    }
            }
        }
    }
    Rectangle {
        id: clockanddate
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 5
            leftMargin: 190
        }
        width: 175
        height: 20
        radius: 7
        color: colours.basecolor
        Text {
            id: clockText
            text: Qt.formatDateTime(new Date(), "hh:mm:ss - ddd, MMMM, dd")
            font.pixelSize: fonts.iconsize
            anchors.centerIn: parent
            color: colours.iconcolor
            font.family: fonts.fontfamily
        }
        Timer {
            interval: 1000
            repeat: true
            running: true
            onTriggered: clockText.text = Qt.formatDateTime(new Date(), "hh:mm:ss - ddd, MMMM, dd")
        }
        MouseArea {
            anchors.fill: parent
            onClicked: calwindow.visible = !calwindow.visible
        }
        PopupWindow {
            id: calwindow
            visible: false
            anchor {
                window: parent.window
                item: clockanddate
                edges: Edges.Bottom
                gravity: Edges.Bottom
            }
            color: "transparent"
            width: 250
            height: 300

            Rectangle {
                anchors.fill: parent
                color: colours.bgcolor
                radius: 10
                clip: true

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    Text {
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        text: Qt.formatDateTime(new Date(), "MMMM yyyy")
                        color: colours.iconcolor
                        font.pixelSize: fonts.iconsize
                        font.family: fonts.fontfamily
                    }
                    DayOfWeekRow {
                        anchors.top: previousItem.bottom
                        width: parent.width
                        delegate: Text {
                            text: model.shortName
                            color: colours.iconcolor
                            font.pixelSize: fonts.iconsize
                            font.family: fonts.fontfamily
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                    MonthGrid {
                        id: grid
                        width: parent.width
                        height: 200
                        month: new Date().getMonth()
                        year: new Date().getFullYear()

                        delegate: Text {
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: model.day
                            color: model.today ? colours.currentdaycal : colours.iconcolor
                            font.bold: model.today
                            opacity: model.month === grid.month ? 1 : 0.5
                        }
                    }
                }
            }
        }
    }
}
