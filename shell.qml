// For anyone reading this, this entire file was vibe coded, no don't ask me how it works. I barely understand how it works myself. Genuinely spent time reading the documentation, I know surprising, but like hell, if you understand it good. Means I coded something right for once. Anyways bye :3c

import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

PanelWindow {
    id: panel
    QtObject {
        id: positions
        property real launcherpos: 7.5
        property real workspaceswitcherpos: 35
        property real calenderpos: 190
    }
    QtObject {
        id: colours
        property color bgcolor: "#1a1b26"
        property color basecolor: "#292942"
        property color iconcolour: "#e6e6e6"
        property color workspaceactive: "#e6e6e6"
        property color workspaceinactive: "#505253"
        property color workspaceactiveicon: "#505253"
        property color workspaceinactiveicon: "#e6e6e6"
        property color currentdaycal: "#ffffff"
    }
    QtObject {
        id: calender
        property var displaydate: new Date()
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
    ApplicationLauncher {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 5
            leftMargin: positions.launcherpos
        }
    }
    HyprlandWorkspaceSwitcher {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 5
            leftMargin: positions.workspaceswitcherpos
        }
    }
    ClockandCalender {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 5
            leftMargin: positions.calenderpos
        }
    }
}
