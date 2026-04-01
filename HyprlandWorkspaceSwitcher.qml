import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: outer
    radius: 30
    color: colours.bgcolor
    width: switcher.width + 7.5 * 2
    height: 30
    Rectangle {
        id: switcher
        height: 20
        radius: 10
        color: colours.basecolor
        anchors.centerIn: parent

        property real minWidth: 145
        property real maxWidth: 342.5
        property int activeWorkspaceId: -1
        property var toplevelsList: []

        property var filtered: {
            let base = [];
            for (let i = 1; i <= 10; i++) {
                base.push({
                    id: i
                });
            }
            return base;
        }

        property bool showOccupiedOnly: false

        property var visableWorkspaces: {
            let _ = activeWorkspaceId;
            let __ = toplevelsList;

            if (!filtered)
                return [];

            if (!showOccupiedOnly)
                return filtered;

            return filtered.filter(ws => {
                if (ws.id === activeWorkspaceId)
                    return true;

                return toplevelsList.some(tl => tl.workspace?.id === ws.id);
            });
        }

        Timer {
            interval: 100
            running: true
            repeat: true
            onTriggered: {
                switcher.activeWorkspaceId = Hyprland.focusedWorkspace?.id ?? -1;
                switcher.toplevelsList = Array.from(Hyprland.toplevels?.values || []);
            }
        }

        width: {
            let total = 0;
            const workspaces = visableWorkspaces;

            for (let i = 0; i < workspaces.length; i++) {
                let ws = workspaces[i];

                let isActive = ws.id === activeWorkspaceId;
                let isOccupied = toplevelsList.some(tl => tl.workspace?.id === ws.id);

                total += isActive ? 35 : (isOccupied ? 25 : 10);

                if (i !== workspaces.length - 1)
                    total += 7.5;
            }

            return Math.max(minWidth, Math.min(maxWidth, total)) + 15;
        }

        Behavior on width {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        Row {
            anchors.fill: parent
            anchors.leftMargin: 7.5
            anchors.rightMargin: 7.5
            spacing: 7.5
            anchors.verticalCenter: parent.verticalCenter

            Repeater {
                model: switcher.visableWorkspaces

                Rectangle {
                    radius: 7
                    anchors.verticalCenter: parent.verticalCenter
                    property bool isActive: modelData.id === switcher.activeWorkspaceId
                    property bool isOccupied: switcher.toplevelsList.some(tl => tl.workspace?.id === modelData.id)

                    width: isActive ? 35 : (isOccupied ? 25 : 10)
                    height: isActive ? 15 : 10

                    color: isActive ? colours.workspaceactive : (isOccupied ? colours.workspaceinactive : colours.workspaceempty)

                    Behavior on width {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.InOutQuad
                        }
                    }

                    Behavior on color {
                        ColorAnimation {
                            duration: 200
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Hyprland.dispatch("workspace " + modelData.id)
                    }
                }
            }
        }
    }
}
