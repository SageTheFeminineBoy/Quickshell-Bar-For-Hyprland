import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    Rectangle {
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
            }
            states: [
                State {
                    name: "active"
                    when: Hyprland.focusedWorkspace.id === 1
                    PropertyChanges {
                        target: workspaceIndicator1
                        width: 35
                        anchors.leftMargin: 7.5
                        color: colours.workspaceactive
                    }
                },
                State {
                    name: "2active"
                    when: Hyprland.focusedWorkspace.id === 2
                    PropertyChanges {
                        target: workspaceIndicator1
                        width: 25
                        anchors.leftMargin: 7.5
                        color: colours.workspaceinactive
                    }
                },
                State {
                    name: "3active"
                    when: Hyprland.focusedWorkspace.id === 3
                    PropertyChanges {
                        target: workspaceIndicator1
                        width: 25
                        anchors.leftMargin: 7.5
                        color: colours.workspaceinactive
                    }
                },
                State {
                    name: "4active"
                    when: Hyprland.focusedWorkspace.id === 4
                    PropertyChanges {
                        target: workspaceIndicator1
                        width: 25
                        anchors.leftMargin: 7.5
                        color: colours.workspacineactive
                    }
                }
            ]
            transitions: Transition {
                ParallelAnimation {
                    NumberAnimation {
                        properties: "width,anchors.leftMargin"
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                    ColorAnimation {
                        duration: 300
                    }
                }
            }
            width: Hyprland.focusedWorkspace.id === 1 ? 35 : 25
            height: 15
            radius: 7
            color: Hyprland.focusedWorkspace.id === 1 ? colours.workspaceactive : colours.workspaceinactive
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Hyprland.dispatch("workspace 1");
                }
            }
        }
        Rectangle {
            id: workspaceIndicator2
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 2.5
            }
            states: [
                State {
                    name: "1active"
                    when: Hyprland.focusedWorkspace.id === 1
                    PropertyChanges {
                        target: workspaceIndicator2
                        width: 25
                        anchors.leftMargin: 50
                        color: colours.workspaceinactive
                    }
                },
                State {
                    name: "active"
                    when: Hyprland.focusedWorkspace.id === 2
                    PropertyChanges {
                        target: workspaceIndicator2
                        width: 35
                        anchors.leftMargin: 40
                        color: colours.workspaceactive
                    }
                },
                State {
                    name: "3active"
                    when: Hyprland.focusedWorkspace.id === 3
                    PropertyChanges {
                        target: workspaceIndicator2
                        width: 25
                        anchors.leftMargin: 40
                        color: colours.workspaceinactive
                    }
                },
                State {
                    name: "4active"
                    when: Hyprland.focusedWorkspace.id === 4
                    PropertyChanges {
                        target: workspaceIndicator2
                        width: 25
                        anchors.leftMargin: 40
                        color: colours.workspaceinactive
                    }
                }
            ]
            transitions: Transition {
                ParallelAnimation {
                    NumberAnimation {
                        properties: "width,anchors.leftMargin"
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                    ColorAnimation {
                        duration: 300
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
                    Hyprland.dispatch("workspace 2");
                }
            }
        }
        Rectangle {
            id: workspaceIndicator3
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 2.5
            }
            states: [
                State {
                    name: "1active"
                    when: Hyprland.focusedWorkspace.id === 1
                    PropertyChanges {
                        target: workspaceIndicator3
                        width: 25
                        anchors.leftMargin: 82.5
                        color: colours.workspaceinactive
                    }
                },
                State {
                    name: "2active"
                    when: Hyprland.focusedWorkspace.id === 2
                    PropertyChanges {
                        target: workspaceIndicator3
                        width: 25
                        anchors.leftMargin: 82.5
                        color: colours.workspaceinactive
                    }
                },
                State {
                    name: "active"
                    when: Hyprland.focusedWorkspace.id === 3
                    PropertyChanges {
                        target: workspaceIndicator3
                        width: 35
                        anchors.leftMargin: 72.5
                        color: colours.workspaceactive
                    }
                },
                State {
                    name: "4active"
                    when: Hyprland.focusedWorkspace.id === 4
                    PropertyChanges {
                        target: workspaceIndicator3
                        width: 25
                        anchors.leftMargin: 72.5
                        color: colours.workspaceinactive
                    }
                }
            ]
            transitions: Transition {
                ParallelAnimation {
                    NumberAnimation {
                        properties: "width,anchors.leftMargin"
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                    ColorAnimation {
                        duration: 300
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
                    Hyprland.dispatch("workspace 3");
                }
            }
        }
        Rectangle {
            id: workspaceIndicator4
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 2.5
            }
            states: [
                State {
                    name: "1active"
                    when: Hyprland.focusedWorkspace.id === 1
                    PropertyChanges {
                        target: workspaceIndicator4
                        width: 25
                        anchors.leftMargin: 115
                        color: colours.workspaceinactive
                    }
                },
                State {
                    name: "2active"
                    when: Hyprland.focusedWorkspace.id === 2
                    PropertyChanges {
                        target: workspaceIndicator4
                        width: 25
                        anchors.leftMargin: 115
                        color: colours.workspaceinactive
                    }
                },
                State {
                    name: "3active"
                    when: Hyprland.focusedWorkspace.id === 3
                    PropertyChanges {
                        target: workspaceIndicator4
                        width: 25
                        anchors.leftMargin: 115
                        color: colours.workspaceinactive
                    }
                },
                State {
                    name: "active"
                    when: Hyprland.focusedWorkspace.id === 4
                    PropertyChanges {
                        target: workspaceIndicator4
                        width: 35
                        anchors.leftMargin: 105
                        color: colours.workspaceactive
                    }
                }
            ]
            transitions: Transition {
                ParallelAnimation {
                    NumberAnimation {
                        properties: "width,anchors.leftMargin"
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                    ColorAnimation {
                        duration: 300
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
                    Hyprland.dispatch("workspace 4");
                }
            }
        }
    }
}
