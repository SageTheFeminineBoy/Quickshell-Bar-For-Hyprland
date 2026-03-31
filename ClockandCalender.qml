import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    component ClockDigit: Item {
        id: rootDigit
        property string char: " "
        readonly property string alphabet: "0123456789:,/- abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Text {
            id: charText
            text: char
            visible: false
            font.pixelSize: fonts.iconsize
            font.family: fonts.fontfamily
        }
        width: charText.implicitWidth
        height: 24
        clip: true

        Column {
            anchors.top: parent.top
            anchors.topMargin: -rootDigit.alphabet.indexOf(rootDigit.char) * rootDigit.height

            Behavior on anchors.topMargin {
                NumberAnimation {
                    duration: 500
                    easing.type: Easing.OutBack
                }
            }

            Repeater {
                model: rootDigit.alphabet.length
                Text {
                    text: rootDigit.alphabet[index]
                    font.family: fonts.fontfamily
                    font.pixelSize: fonts.iconsize
                    color: colours.iconcolour
                    height: 24
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }
    Rectangle {
        id: clockanddate
        width: 230
        height: 20
        radius: 7
        color: colours.basecolor
        property string timeString: Qt.formatDateTime(new Date(), "hh:mm:ss - dd, MM, yy")
        Row {
            anchors.centerIn: parent
            spacing: 2

            Repeater {
                model: clockanddate.timeString.length
                delegate: ClockDigit {
                    char: clockanddate.timeString[index]
                }
            }
        }
        Timer {
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                clockanddate.timeString = Qt.formatDateTime(new Date(), "hh:mm:ss - dd, MM, yy");
            }
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
                margins.top: 30
            }
            onVisibleChanged: {
                if (!visible) {
                    let today = new Date();

                    calender.displaydate = today;

                    grid.month = today.getMonth();
                    grid.year = today.getFullYear();
                    currentmonth.text = QtformatDateTime(today, "MMMM yyyy");
                }
            }
            grabFocus: true
            color: "transparent"
            width: 250
            height: 300

            Rectangle {
                anchors.fill: parent
                color: colours.bgcolor
                radius: 10
                clip: true

                Rectangle {
                    anchors.centerIn: parent
                    radius: 10
                    color: colours.basecolor
                    width: 240
                    height: 290
                }

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    RowLayout {
                        id: calendernav
                        anchors {
                            top: parent.top
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }
                        spacing: 15
                        Text {
                            id: lastmonth
                            text: " < "
                            color: colours.iconcolour
                            font.pixelSize: fonts.iconsize
                            font.family: fonts.fontfamily
                            width: 40
                            height: 40
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    let current = calender.displaydate;
                                    let next = new Date(current.getFullYear(), current.getMonth() - 1, 1);
                                    calender.displaydate = next;
                                    grid.month = next.getMonth();
                                    grid.year = next.getFullYear();
                                }
                            }
                        }
                        Text {
                            id: currentmonth
                            text: Qt.formatDateTime(calender.displaydate, "MMMM yyyy")
                            Layout.fillWidth: true
                            horizontalAlignment: Text.AlignHCenter
                            color: colours.iconcolour
                            font.pixelSize: fonts.iconsize
                            font.family: fonts.fontfamily
                        }
                        Text {
                            id: nextmonth
                            text: " > "
                            color: colours.iconcolour
                            font.pixelSize: fonts.iconsize
                            font.family: fonts.fontfamily
                            width: 40
                            height: 40
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    let current = calender.displaydate;
                                    let next = new Date(current.getFullYear(), current.getMonth() + 1, 1);
                                    calender.displaydate = next;
                                    grid.month = next.getMonth();
                                    grid.year = next.getFullYear();
                                }
                            }
                        }
                    }
                    DayOfWeekRow {
                        id: dotwr
                        anchors.top: parent.top
                        anchors.topMargin: 30
                        width: parent.width
                        delegate: Text {
                            text: model.shortName
                            color: colours.iconcolour
                            font.pixelSize: fonts.iconsize
                            font.family: fonts.fontfamily
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                    MonthGrid {
                        id: grid
                        anchors.top: dotwr.bottom
                        anchors.topMargin: 10
                        width: parent.width
                        height: 200
                        month: calender.displaydate.getMonth()
                        year: calender.displaydate.getFullYear()
                        Binding {
                            target: grid
                            property: "month"
                            value: calender.displaydate.getMonth()
                        }
                        Binding {
                            target: grid
                            property: "year"
                            value: calender.displaydate.getFullYear()
                        }

                        delegate: Text {
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: model.day
                            color: model.today ? colours.currentdaycal : colours.iconcolour
                            font.bold: model.today
                            font.family: fonts.fontfamily
                            font.pixelSize: fonts.iconsize
                            opacity: model.month === grid.month ? 1 : 0.5
                        }
                    }
                }
            }
        }
    }
}
